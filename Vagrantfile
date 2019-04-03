# -*- mode: ruby -*-
# vi: set ft=ruby :

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

#
# REMBMBER: To configure DNS servers in ./hosts file's [dns] group
# for your network.  Sometimes Google's DNS servers are blocked.
#

# This class uses VirtualBox and therefor expect Windows HyperV to be disabled.
if Vagrant::Util::Platform.windows? and Vagrant::Util::Platform.windows_hyperv_enabled?
  puts "Windows HyperV is expected to be disabled."
  exit(false)
end

# Holds the version of software for the Ansible roles to install
software_versions = {
  drone_version: "1",
  drone_cli_version: "1.0.7",
  golang_version: "1.12.1",
  gitlab_version: "11.8.3",
  inspec_version: "3.9.0",
  inspec_rpm_version: "3.9.0/el/7/inspec-3.9.0-1.el7.x86_64",
  python_version: "2.7.16",
  registry_version: "2.7.1",
  plantuml_server_version: "latest",
  sonarqube_version: "7.1", # 7.4-community is different enough i will need to look into in order to patch
  sonar_scanner_cli_version: "3.3.0.1492",
  selenium_standalone_chrome_version: "3.14.0",
  selenium_standalone_firefox_version: "3.14.0",
  taiga_version: "4.0.4",
  zap2docker_stable_version: "2.7.0"
#  openshift_origin_server_tools_version: "v3.10.0/openshift-origin-server-v3.10.0-dd10d17-linux-64bit",
#  openshift_origin_client_tools_version: "v3.10.0/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit",
}

Vagrant.configure('2') do |config|

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
      # config.proxy.enabled = true
      config.proxy.enabled = { docker: false } 
      puts "HTTP Proxy variables set."
      puts "http_proxy = #{ config.proxy.http }"
      puts "https_proxy = #{ config.proxy.https }"
      puts "ftp_proxy = #{ config.proxy.ftp }"
      puts "no_proxy = #{ config.proxy.no_proxy }"
    else
      raise "Missing vagrant-proxyconf plugin.  Install via: vagrant plugin install vagrant-proxyconf"
    end
  else
    puts "No http_proxy or https_proxy environment variables are set."
    config.proxy.http = nil
    config.proxy.https = nil
    config.proxy.ftp = nil
    config.proxy.no_proxy = nil   
    config.proxy.enabled = false
  end 

  # Print Docker DNS servers configured in host file
  puts "Docker is configured to us the folllowing DNS server(s):"
  f = File.open('hosts','r')
  f.each_line do |line|
    if line =~ /^ns[1-2] ansible_host/
       puts "- #{line.split('=')[1]}"
    end
  end
  f.close 

  # To add Enterprise CA Certificates to all vagrants
  #
  # Depends on the install of the vagrant-ca-certificates plugin
  #
  # To use:
  #
  # 1.  Install `vagrant plugin install vagrant-ca-certificates`.
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
    if Vagrant.has_plugin?('vagrant-ca-certificates')
      puts "CA Certificates set to #{ ENV['CA_CERTIFICATES'] }"
      config.ca_certificates.enabled = true
      config.ca_certificates.certs = ENV['CA_CERTIFICATES'].split(',')
    else
      raise "Missing vagrant-ca-certificates plugin.  Install via: vagrant plugin install vagrant-ca-certificates"
    end      
  else
    puts "No CA_CERTIFICATES environment variable set."
    config.ca_certificates.certs = nil
    config.ca_certificates.enabled = false
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  else
    raise "Missing vagrant-cachier plugin.  Install via: vagrant plugin install vagrant-cachier"
  end

  if !Vagrant.has_plugin?("vagrant-disksize")
    raise "Missing vagrant-disksize plugin.  Install via: vagrant plugin install vagrant-disksize"
  end

  if Vagrant::Util::Platform.windows? and !Vagrant.has_plugin?('vagrant-vbguest') 
    raise "Missing vagrant-vbguest plugin.  Install via: vagrant plugin install vagrant-vbguest"
  end

  # if (! File.file?("./devops.box"))
  #   raise "Must create the devops.box by running ./build_devops_box.sh"
  # end

  ## Provision development vagrant
  config.vm.define "development", primary: true do |development|
    development.vm.box = "centos/7"
#    development.disksize.size = "80GB"
    development.vm.network "private_network", ip: "192.168.0.10"  
    development.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh'
    development.vm.hostname = "development"
    development.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    development.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "DevOps Class - development"
      virtualbox.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10]
      virtualbox.memory = 2048
      virtualbox.cpus = 2
      virtualbox.gui = false  

      development_docker_disk = './development_docker.vdi'

      unless File.exist?(development_docker_disk)
        virtualbox.customize ['createmedium', '--filename', development_docker_disk, '--size', 20 * 1024]
      end

      # the value of storage_system_bus depends on your platform
      storage_system_bus = "IDE" 

      # Provisions a drive for Docker storage
      virtualbox.customize ['storageattach', :id, '--storagectl', storage_system_bus, '--port', 1, '--device', 0, '--type', 'hdd', '--medium', development_docker_disk]
    end

    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible/development-playbook.yml"
      ansible.inventory_path = "hosts"
      ansible.limit = "development"
      ansible.install_mode = :default
      ansible.compatibility_mode = "2.0"
      ansible.verbose = true # true (equivalent to v), vvv, vvvv

      # Pass top-level variables into Ansible from Vagrant
      ansible.extra_vars = software_versions

      if development.proxy.enabled
        ansible.extra_vars[:http_proxy] = (!config.proxy.http ? "" : config.proxy.http)
        ansible.extra_vars[:https_proxy] = (!config.proxy.https ? "" : config.proxy.https)
        ansible.extra_vars[:ftp_proxy] = (!config.proxy.ftp ? "" : config.proxy.ftp)
        ansible.extra_vars[:no_proxy] = (!config.proxy.no_proxy ? "" : config.proxy.no_proxy)
      end

      if development.ca_certificates.enabled
        ansible.extra_vars[:CA_CERTIFICATES] = config.ca_certificates.certs
      end
    end
  end  

  ## Provision the pipeline vagrant
  config.vm.define "toolchain", autostart: false do |toolchain|
    toolchain.vm.box = "centos/7"
#    toolchain.disksize.size = "80GB"
    toolchain.vm.network "private_network", ip: "192.168.0.11"  
    toolchain.vm.network :forwarded_port, guest: 22, host: 2223, id: 'ssh'
    toolchain.vm.hostname = "toolchain"
    toolchain.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    toolchain.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "DevOps Class - toolchain"
      virtualbox.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10]
      virtualbox.memory = 6144 #4096
      virtualbox.cpus = 4
      virtualbox.gui = false  

      toolchain_docker_disk = './toolchain_docker.vdi'

      unless File.exist?(toolchain_docker_disk)
        virtualbox.customize ['createmedium', '--filename', toolchain_docker_disk, '--size', 20 * 1024]
      end

      # the value of storage_system_bus depends on your platform
      storage_system_bus = "IDE" 

      # Provisions a drive for Docker storage
      virtualbox.customize ['storageattach', :id, '--storagectl', storage_system_bus, '--port', 1, '--device', 0, '--type', 'hdd', '--medium', toolchain_docker_disk]
    end

    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible/toolchain-playbook.yml"
      ansible.inventory_path = "hosts"
      ansible.limit = "toolchain"
      ansible.install_mode = :default
      ansible.compatibility_mode = "2.0"
      ansible.verbose = 'vvvv' # true (equivalent to v), vvv, vvvv

      # Pass top-level variables into Ansible from Vagrant
      ansible.extra_vars = software_versions

      if toolchain.proxy.enabled
        ansible.extra_vars[:http_proxy] = (!config.proxy.http ? "" : config.proxy.http)
        ansible.extra_vars[:https_proxy] = (!config.proxy.https ? "" : config.proxy.https)
        ansible.extra_vars[:ftp_proxy] = (!config.proxy.ftp ? "" : config.proxy.ftp)
        ansible.extra_vars[:no_proxy] = (!config.proxy.no_proxy ? "" : config.proxy.no_proxy)
      end

      if toolchain.ca_certificates.enabled
        ansible.extra_vars[:CA_CERTIFICATES] = config.ca_certificates.certs
      end
    end
  end
end
