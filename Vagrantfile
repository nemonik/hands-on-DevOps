# -*- mode: ruby -*-
# vi: set ft=ruby :

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

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

# Used to hold all the ANSIBLE_EXTRA_VARS and provide convienance methods
require File.join(vagrantfilePath, 'ansible_extra_vars.rb')

# Colorize string printed to StandardOut
require File.join(vagrantfilePath, '/string.rb')

Vagrant.configure('2') do |config|

  puts "WARN: Remember To configure DNS servers in ./hosts file's [dns] group".pink
  puts "WARN: for your network.  Sometimes Google's DNS servers are blocked.".pink

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
    if Vagrant.has_plugin?('vagrant-proxyconf')
      config.proxy.http = ENV['http_proxy']
      config.proxy.https = ENV['https_proxy']
      config.proxy.ftp = ENV['ftp_proxy']
      config.proxy.no_proxy = ENV['no_proxy']
      config.proxy.enabled = { docker: false }
      puts "INFO: HTTP Proxy variables set.".green
      puts "INFO: http_proxy = #{ config.proxy.http }".green
      puts "INFO: https_proxy = #{ config.proxy.https }".green
      puts "INFO: ftp_proxy = #{ config.proxy.ftp }".green
      puts "INFO: no_proxy = #{ config.proxy.no_proxy }".green
    else
      raise "Missing vagrant-proxyconf plugin.  Install via: vagrant plugin install vagrant-proxyconf"
    end
  else
    puts "INFO: No http_proxy or https_proxy environment variables are set.".green
    config.proxy.http = nil
    config.proxy.https = nil
    config.proxy.ftp = nil
    config.proxy.no_proxy = nil
    config.proxy.enabled = false
  end

  # Print Docker DNS servers configured in host file
  puts "INFO: Docker is configured to us the folllowing DNS server(s):".green
  f = File.open(File.join(vagrantfilePath, 'hosts'),'r')
  f.each_line do |line|
    if line =~ /^ns[1-2] ansible_host/
       puts "INFO: - #{line.split('=')[1].chomp}".green
    end
  end
  f.close

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
    if Vagrant.has_plugin?('vagrant-certificates')
      puts "INFO: CA Certificates set to #{ ENV['CA_CERTIFICATES'] }".green

      config.certificates.enabled = true
      config.certificates.certs = ENV['CA_CERTIFICATES'].split(',')
    else
      raise "Missing vagrant-certificates plugin.  Install via: vagrant plugin install vagrant-certificates"
    end
  else
    puts "INFO: No CA_CERTIFICATES environment variable set.".green
    config.certificates.certs = nil
    config.certificates.enabled = false
  end

  if Vagrant.has_plugin?('vagrant-cachier')
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  else
    raise "Missing vagrant-cachier plugin.  Install via: vagrant plugin install vagrant-cachier"
  end

  if !Vagrant.has_plugin?('vagrant-disksize')
    raise "Missing vagrant-disksize plugin.  Install via: vagrant plugin install vagrant-disksize"
  end

  if Vagrant::Util::Platform.windows? and !Vagrant.has_plugin?('vagrant-vbguest')
    raise "Missing vagrant-vbguest plugin.  Install via: vagrant plugin install vagrant-vbguest"
  end

  if ( ARGV.include? 'up' ) 
    if (`vagrant box list | grep nemonik/devops`.empty? )
      puts "INFO: Creating nemonik/devops box...".green
      require 'open3'
      Open3.popen2e('bash', '-c', 'cd box && ./build_box.sh') do |stdin, stdout, stderr|
        puts stdout.each { |line| puts line }
      end
    else
      puts "INFO: Using existing nemonik/devops box...".green
    end
  end

  # Clean up docker volumes...
  if (ARGV.include? 'destroy')
    if (File.file?(File.join(vagrantfilePath, 'toolchain_docker.vdi')) && (ARGV.include?('toolchain') || !ARGV.include?('development')))
      File.delete(File.join(vagrantfilePath, 'toolchain_docker.vdi'))

      # Vagrant on Windows cannot overwrite these files, so remove em now. 
      File.delete(File.join(vagrantfilePath, 'k3s_token.txt'))
      File.delete(File.join(vagrantfilePath, 'kubeconfig.yml'))
      File.delete(File.join(vagrantfilePath, 'vagrant-token.txt'))
    end 
    if (File.file?(File.join(vagrantfilePath, 'development_docker.vdi')) && (ARGV.include?('development') || !ARGV.include?('toolchain')))
      File.delete(File.join(vagrantfilePath, 'development_docker.vdi'))
    end
  end

  ## Provision the toolchain vagrant
  config.vm.define 'toolchain' do |toolchain|
    toolchain.vm.box = 'nemonik/devops'
    toolchain.vm.network :private_network, ip: '192.168.0.11'
#    toolchain.vm.network :forwarded_port, guest: 22, host: 2223, id: 'ssh'
    toolchain.vm.hostname = 'toolchain'
    toolchain.vm.synced_folder '.', '/vagrant', type: 'virtualbox', owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=664"]
    toolchain.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = 'DevOps Class - toolchain'
      virtualbox.customize ['guestproperty', 'set', :id, '/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold', 10]
      virtualbox.memory = 6144 #4096
      virtualbox.cpus = 4
      virtualbox.gui = false

      toolchain_docker_disk = File.join(vagrantfilePath, 'toolchain_docker.vdi')

      unless File.exist?(toolchain_docker_disk)
        virtualbox.customize ['createmedium', '--filename', toolchain_docker_disk, '--size', 40 * 1024]
      end

      # the value of storage_system_bus depends on your platform
      storage_system_bus = "IDE"

      # Provisions a drive for Docker storage
      virtualbox.customize ['storageattach', :id, '--storagectl', storage_system_bus, '--port', 1, '--device', 0, '--type', 'hdd', '--medium', toolchain_docker_disk]
    end

    ansible_extra_vars_string = AnsibleExtraVars::as_string( config.proxy.http, config.proxy.https, config.proxy.ftp, config.proxy.no_proxy, config.certificates.certs )

    $script = <<-SCRIPT
      echo Installing the base...
      echo "cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="toolchains" --inventory-file=hosts --extra-vars=#{ansible_extra_vars_string} -vvvv --vault-password-file=/vagrant/vault_pass ansible/toolchain-base-playbook.yml"
      cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="toolchains" --inventory-file=hosts --extra-vars=#{ansible_extra_vars_string} -vvvv --vault-password-file=/vagrant/vault_pass ansible/toolchain-base-playbook.yml
    SCRIPT

    toolchain.vm.provision "shell", inline: $script, privileged: false, reset: true

    $script = <<-SCRIPT
      echo Installing the tools...
      echo "cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="toolchains" --inventory-file=hosts --extra-vars=#{ansible_extra_vars_string} -vvvv --vault-password-file=/vagrant/vault_pass ansible/toolchain-tools-playbook.yml"
      cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="toolchains" --inventory-file=hosts --extra-vars=#{ansible_extra_vars_string} -vvvv --vault-password-file=/vagrant/vault_pass ansible/toolchain-tools-playbook.yml
    SCRIPT

    toolchain.vm.provision "shell", inline: $script, privileged: false, reset: true
  end

  ## Provision development vagrant
  config.vm.define "development" do |development|
    development.vm.box = 'nemonik/devops'
    development.vm.network :private_network, ip: '192.168.0.10'
#    development.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh'
    development.vm.hostname = 'development'
    development.vm.synced_folder '.', '/vagrant', type: 'virtualbox', owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=664"]
    development.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = 'DevOps Class - development'
      virtualbox.customize ['guestproperty', 'set', :id, '/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold', 10]
      virtualbox.memory = 2048
      virtualbox.cpus = 2
      virtualbox.gui = false

      development_docker_disk = File.join(vagrantfilePath, 'development_docker.vdi')

      unless File.exist?(development_docker_disk)
        virtualbox.customize ['createmedium', '--filename', development_docker_disk, '--size', 40 * 1024]
      end

      # the value of storage_system_bus depends on your platform
      storage_system_bus = "IDE"

      # Provisions a drive for Docker storage
      virtualbox.customize ['storageattach', :id, '--storagectl', storage_system_bus, '--port', 1, '--device', 0, '--type', 'hdd', '--medium', development_docker_disk]
    end

    ansible_extra_vars_string = AnsibleExtraVars::as_string( config.proxy.http, config.proxy.https, config.proxy.ftp, config.proxy.no_proxy, config.certificates.certs )

    $script = <<-SCRIPT
      echo Configuring...
      echo "cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="developments" --inventory-file=hosts --extra-vars=#{ansible_extra_vars_string} -vvvv --vault-password-file=/vagrant/vault_pass ansible/development-playbook.yml"
      cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="developments" --inventory-file=hosts --extra-vars=#{ansible_extra_vars_string} -vvvv --vault-password-file=/vagrant/vault_pass ansible/development-playbook.yml
    SCRIPT

    development.vm.provision "shell", inline: $script, privileged: false, reset: true
  end
end
