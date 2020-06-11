#-*- mode: ruby -*-
# vi: set ft=ruby :

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

$VERBOSE = nil

# This class uses VirtualBox and therefor expects Windows HyperV to be disabled.
if Vagrant::Util::Platform.windows? and Vagrant::Util::Platform.windows_hyperv_enabled?
  puts "Windows HyperV is expected to be disabled."
  exit(false)
end

# Vagrant will start at your current path and then move upward looking
# for a Vagrant file.  The following will provide the path for the found
# Vagrantfile, so you can execute `vagrant` commands on the command-line
# anywhere in the project a Vagrantfile doesn't already exist.
vagrantfilePath = ""
if File.dirname(__FILE__).end_with?('Vagrantfile')
   vagrantfilePath = File.dirname(File.dirname(__FILE__))
else
   vagrantfilePath = File.dirname(__FILE__)
end

# Used to hold all the configuration variable and convienance methods for accessing
require File.join(vagrantfilePath, 'configuration_vars.rb')

# Colorize string printed to StandardOut
require File.join(vagrantfilePath, '/string.rb')

box = ConfigurationVars::VARS[:base_box]
os = box.split('/')[1]
box = "nemonik/devops_#{os}"

uninstall_plugins = %w( vagrant-cachier vagrant-alpine )
required_plugins = %w( vagrant-timezone vagrant-proxyconf vagrant-certificates vagrant-disksize vagrant-reload )

if (not os.downcase.include? 'alpine')
  required_plugins = required_plugins << "vagrant-vbguest"
else
  # as alpine is currently not supported by vagrant-vbguest
  uninstall_plugins = uninstall_plugins << "vagrant-vbguest"
end

# Uninstall the following plugins
plugin_uninstalled = false
uninstall_plugins.each do |plugin|
  if Vagrant.has_plugin?(plugin)
    system "vagrant plugin uninstall #{plugin}"
    plugin_uninstalled = true
  end
end

# Require the following plugins
plugin_installed = false
required_plugins.each do |plugin|
  unless Vagrant.has_plugin?(plugin)
    system "vagrant plugin install #{plugin}"
    plugin_installed = true
  end
end

# if plugins were installed, restart
if plugin_installed || plugin_uninstalled
  puts "restarting"
  exec "vagrant #{ARGV.join' '}"
end

# Write hosts file for Ansible

require 'erb'

@worker_nodes = [*1..ConfigurationVars::VARS[:nodes]-1]

template = <<-TEXT
#
# Do not change this file by hand as it is dynamically generated via the Vagrantfile.
#
development ansible_connection=local
master ansible_connection=local
<% for @node in @worker_nodes %>node<%= @node %> ansible_connection=local
<% end %>
[boxes]
box

[masters]
master

[workers]
<% for @node in @worker_nodes %>node<%= @node %>
<% end %>
[developments]
development
TEXT

open(File.join(vagrantfilePath, 'hosts'), 'w') do |f|
 f.puts ERB.new(template).result
end

# Retrieve the contents of the insecure-private_key
ssh_insecure_key = File.read("#{Dir.home}/.vagrant.d/insecure_private_key")

# Provision vagrants
ENV['LC_ALL']='en_US.UTF-8'
ENV['LC_CTYPE']='en_US.UTF-8'
Vagrant.configure("2") do |config|

  if ( ARGV.include? 'up' )
    if (`vagrant box list | grep #{box}`.empty? )
      puts "INFO: Creating #{box} box...".green
      require 'open3'
      Open3.popen2e('bash', '-c', 'cd box && ./build_box.sh') do |stdin, stdout, stderr|
        puts stdout.each { |line| puts line }
      end
    else
      puts "INFO: Using existing #{box} box...".green
    end
  end

  # Set proxy settings for all vagrants
  #
  # Depends on install of vagrant-proxyconf plugin.
  #
  # To use:
  #
  # 1.  Install `vagrant plugin install vagrant-proxyconf`
  # 2.  Set environmental variables for `http_proxy`, `https_proxy`, `ftp_proxy`, and `no_proxy`
  #
  #     For example:
  #
  #     ```
  #     export http_proxy=
  #     export https_proxy=
  #     export ftp_proxy=
  #     export no_proxy=
  #     ```
  if (ENV['http_proxy'] || ENV['https_proxy'])
    config.proxy.http = ENV['http_proxy']
    config.proxy.https = ENV['https_proxy']
    config.proxy.ftp = ENV['ftp_proxy']
    config.proxy.no_proxy = ENV['no_proxy']
    config.proxy.enabled = { docker: false }

    if ( ARGV.include? 'up' ) || ( ARGV.include? 'provision' )
      puts "INFO: HTTP Proxy variables set.".green
      puts "INFO: http_proxy = #{ config.proxy.http }".green
      puts "INFO: https_proxy = #{ config.proxy.https }".green
      puts "INFO: ftp_proxy = #{ config.proxy.ftp }".green
      puts "INFO: no_proxy = #{ config.proxy.no_proxy }".green
    end
  else
    if ( ARGV.include? 'up' ) || ( ARGV.include? 'provision' )
      puts "INFO: No http_proxy or https_proxy environment variables are set.".green
    end

    config.proxy.http = nil
    config.proxy.https = nil
    config.proxy.ftp = nil
    config.proxy.no_proxy = nil
    config.proxy.enabled = false
  end

  # To add Enterprise CA Certificates to all vagrants
  #
  # Depends on the install of the vagrant-certificates plugin
  #
  # To use:
  #
  # 1.  Install `vagrant plugin install vagrant-certificates`.
  # 2.  Set environement variable for `CA_CERTIFICATES` containing a comma separated list of certificate URLs.
  #
  #     For example:
  #
  #     ```
  #     export CA_CERTIFICATES=http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20ROOT.crt,http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20NPE%20CA-3%281%29.crt
  #     ```
  #
  #     The Root certificate *must* be denotes as the root certificat like so:
  #
  #     http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20ROOT.crt
  #

  if ENV['CA_CERTIFICATES']
    # Because @williambailey's vagrant-ca-certificates has an issue  https://github.com/williambailey/vagrant-ca-certificates/issues/34 I am using @Toilal fork, vagrant-certificates
    if ( ARGV.include? 'up' ) || ( ARGV.include? 'provision' )
      puts "INFO: CA Certificates set to #{ ENV['CA_CERTIFICATES'] }".green
    end

    config.certificates.enabled = true
    config.certificates.certs = ENV['CA_CERTIFICATES'].split(',')
  else
    if ( ARGV.include? 'up' ) || ( ARGV.include? 'provision' )
      puts "INFO: No CA_CERTIFICATES environment variable set.".green
    end
    config.certificates.certs = nil
    config.certificates.enabled = false
  end

  vars_string = ConfigurationVars::as_string( config.proxy.http, config.proxy.https, config.proxy.ftp, config.proxy.no_proxy, config.certificates.certs)

  # use the default insecure key
  config.ssh.insert_key = false
  config.ssh.private_key_path = "#{Dir.home}/.vagrant.d/insecure_private_key"

  # debug ssh
#  config.ssh.extra_args = "-vvv"

  config.vm.box = box
  config.vm.box_version = 0

  # nfs does not appear to work reliably on OS X Catalina (See: https://github.com/hashicorp/vagrant/issues/11234)
  if Vagrant::Util::Platform.windows? 
    config.vm.synced_folder '.', '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=664']
  elsif Vagrant::Util::Platform.platform.include? 'darwin'
    projectPath=File.join('/System/Volumes/Data/Users/', ENV['USER'], vagrantfilePath.split(ENV['USER']).last)

    config.vm.synced_folder projectPath, '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=664']
  else
    config.vm.synced_folder ".",  '/vagrant', type: "nfs"
  end

  config.timezone.value = :host

  # shell scripting to copy the private key into the vagrant
  install_secure_key = <<-SHELL
    echo Copy insecure key to /home/vagrant/.ssh/id_rsa...
    rm -Rf /home/vagrant/.ssh/id_rsa
    echo "#{ssh_insecure_key}" > /home/vagrant/.ssh/id_rsa
    chown vagrant /home/vagrant/.ssh/id_rsa
    chmod 400 /home/vagrant/.ssh/id_rsa
  SHELL

  # shell scripting to install root user cached content
  root_cached_template = ConfigurationVars::DETERMINE_OS_TEMPLATE + ConfigurationVars::OS_PACKAGES_FROM_CACHE_TEMPLATE + ConfigurationVars::SITE_PACKAGES_FROM_CACHE_TEMPLATE

  # shell scripting to install user cached content
  user_cached_template = ConfigurationVars::USER_CACHED_CONTENT_TEMPLATE

  (0..ConfigurationVars::VARS[:nodes]-1).each do |node|

    if (node == 0) then
      hostname = 'master'
      masters_root_cached = root_cached_template.gsub! /TYPE/, 'masters'
      masters_user_cached = user_cached_template.gsub! /TYPE/, 'masters'
    else
      hostname = "node#{node}"
      workers_root_cached = root_cached_template.gsub! /TYPE/, 'workers'
      workers_user_cached = user_cached_template.gsub! /TYPE/, 'workers'
    end

    config.vm.define hostname do |vagrant|
      vagrant.vm.network 'private_network', ip: "#{ ConfigurationVars::VARS[:network_prefix] }.#{10 + node}"
      vagrant.vm.hostname = hostname

      vagrant.vm.provider :virtualbox do |virtualbox|
        virtualbox.name = "Hands-on DevOps class - #{os} - #{hostname}"
        virtualbox.gui = false

        # disable audio
        virtualbox.customize ['modifyvm', :id, '--audio', 'none']

        virtualbox.customize ['modifyvm', :id, '--nic1', 'nat']
        virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
        virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        virtualbox.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-interval", 10000 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-min-adjust", 100 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-on-restore", 1 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-start", 1 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]

        if (node == 0) then
          virtualbox.memory = 8192 #8192 #6144 #4096
          virtualbox.cpus = 8 #8 #4
        else
          virtualbox.memory = 2048
          virtualbox.cpus = 2
        end

        if (ConfigurationVars::VARS[:openebs_drives].downcase == 'yes') then # create OpenEBS drives on each node

          openebs_disk = "./#{hostname}_openebs_disk.vdi"

          # Add a second drive for OpenEBS
          unless File.exist?(openebs_disk)
            virtualbox.customize ['createmedium', '--filename', openebs_disk, '--size', ConfigurationVars::VARS[:openebs_drive_size_in_gb] * 1024]
          end

          # the value of storage_system_bus depends on your platform
          storage_system_bus = "IDE" 

          # provisions the drive
          virtualbox.customize ['storageattach', :id, '--storagectl', storage_system_bus, '--port', 1, '--device', 0, '--type', 'hdd', '--medium', openebs_disk]
        end
      end

      # Configure via shell and Ansible

      if (node == 0) then # the master node

        # install root user cached content
        vagrant.vm.provision 'root_cached_content', type: :shell, privileged: true, inline: "#{masters_root_cached}"

        # install user cached content
        vagrant.vm.provision 'user_cached_content', type: :shell, privileged: false, inline: "#{masters_user_cached}"

        vagrant.vm.provision 'ansible', type: :shell, privileged: false, reset: true, inline: <<-SHELL
          echo Configuring #{hostname} via Ansible...
          cd /vagrant
          PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true /home/vagrant/.local/bin/ansible-playbook -vvvv --extra-vars=#{vars_string} --extra-vars='ansible_python_interpreter="/usr/bin/env #{ConfigurationVars::VARS[:ansible_python_version]}"' --vault-password-file=vault_pass --limit="masters" --inventory-file=hosts ansible/master-playbook.yml
        SHELL
      else # worker nodes
        # install root user cached content
        vagrant.vm.provision 'root_cached_content', type: :shell, privileged: true, inline: "#{workers_root_cached}"

        # install user cached content
        vagrant.vm.provision 'user_cached_content', type: :shell, privileged: false, inline: "#{workers_user_cached}"

        vagrant.vm.provision 'ansible', type: :shell, privileged: false, reset: true, inline: <<-SHELL
          echo Configuring k3s worker node...

          #{install_secure_key}

          cd /vagrant
          PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true /home/vagrant/.local/bin/ansible-playbook -vvvv --extra-vars=#{vars_string} --extra-vars='ansible_python_interpreter="/usr/bin/env #{ConfigurationVars::VARS[:ansible_python_version]}"' --vault-password-file=vault_pass --limit="workers" --inventory-file=hosts ansible/worker-playbook.yml
        SHELL
      end
    end
  end

  if (ConfigurationVars::VARS[:create_development].downcase == 'yes') then # create development vagrant
    config.vm.define 'development' do |vagrant|
      vagrant.vm.network 'private_network', ip: "#{ ConfigurationVars::VARS[:network_prefix] }.9"
      vagrant.vm.hostname = 'development'

      vagrant.vm.provider :virtualbox do |virtualbox|
        virtualbox.name = "Hands-on DevOps class - #{os} - #{vagrant.vm.hostname}"
        virtualbox.gui = false

        virtualbox.customize ['modifyvm', :id, '--audio', 'none']
        virtualbox.customize ['modifyvm', :id, '--nic1', 'nat']
        virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
        virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        virtualbox.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-interval", 10000 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-min-adjust", 100 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-on-restore", 1 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-start", 1 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]

        virtualbox.memory = 2048
        virtualbox.cpus = 2
      end

      developments_root_cached = root_cached_template.gsub! /TYPE/, 'developments'
      developments_user_cached = user_cached_template.gsub! /TYPE/, 'developments'

      # install root user cached content
      vagrant.vm.provision 'root_cached_content', type: :shell, privileged: true, inline: "#{developments_root_cached}"

      # install user cached content
      vagrant.vm.provision 'user_cached_content', type: :shell,  privileged: false, inline: "#{developments_user_cached}"

      vagrant.vm.provision 'ansible', type: :shell, privileged: false, reset: true, inline: <<-SHELL
        echo Configuring development node...

        #{install_secure_key}
 
        echo Execute ansible-playbook...
        cd /vagrant
        PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true /home/vagrant/.local/bin/ansible-playbook -vvvv --extra-vars=#{vars_string} --extra-vars='ansible_python_interpreter="/usr/bin/env #{ConfigurationVars::VARS[:ansible_python_version]}"' --vault-password-file=vault_pass --limit="developments" --inventory-file=hosts ansible/development-playbook.yml
      SHELL
    end
  end
end
