#-*- mode: ruby -*-
# vi: set ft=ruby :

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

module ConfigurationVars

  # Define variablese
  VARS = {

    # The network block the cluster and apps will be in
    network_prefix: "192.168.0",

#    # Add OpenEBS drives ('yes'/'no')
#    openebs_drives: 'yes',
    openebs_drives: 'no',

    # Sets the OpenEBS drive size in GB
    openebs_drive_size_in_gb: 100,

    # Provision and configure development vagrant ('yes'/'no')
    create_development: 'no',
#    create_development: 'yes',
    development_is_worker_node: 'yes',

    # The number of nodes to provision the Kubernetes cluster. One will be a master.
#    nodes: 3,
    nodes: 1,

    # The Vagrant box to base our DevOps box on.  Pick just one.

    base_box: 'centos/7',
    base_box_version: '2004.01', 

#    base_box: 'geerlingguy/centos7',
#    base_box_version: '1.2.22',

#    base_box: 'ubuntu/bionic64',
#    base_box_version: '20200304.0.0',

#    base_box: 'nemonik/alpine310',
#    base_box_version: '0',

    ansible_version: '2.9.9',

    default_retries: '60',
    default_delay: '10',

    docker_timeout: '300',
    docker_retries: '60',
    docker_delay: '10',

    k3s_version: 'v1.17.5+k3s1',
    k3s_cluster_secret: 'kluster_secret',

    kubectl_version: 'v1.17.0',
    kubectl_checksum: 'sha256:6e0aaaffe5507a44ec6b1b8a0fb585285813b78cc045f8804e70a6aac9d1cb4c',

    kubernetes_dashboard: 'yes',
    kubernetes_dashboard_version: 'v2.0.0',

    traefik: 'yes',
    traefik_version: '1.7.24',
    traefik_http_port: '80',
    traefik_admin_port: '8080',
    traefik_host: '192.168.0.200',

    metallb: 'yes',
    metallb_version: 'v0.8.3',

    kompose_version: '1.18.0',

    docker_compose_version: '1.24.1',
    docker_compose_pip_version: '1.25.0rc2',

    helm_cli_version: '3.2.1',
    helm_cli_checksum: '018f9908cb950701a5d59e757653a790c66d8eda288625dbb185354ca6f41f6b',

    registry: 'yes',
    registry_version: '2.7.1',
    registry_host: '192.168.0.201',
    registry_port: '5000',

    gitlab: 'yes',
    gitlab_version: '13.0.5',
    gitlab_host: '192.168.0.202',
    gitlab_port: '80',
    gitlab_ssh_port: '10022',
    gitlab_user: 'root',

    drone: 'yes',
    drone_version: '1.7.0',
    drone_runner_docker_version: '1.3.0',
    drone_host: '192.168.0.10',

    drone_cli_version: 'v1.1.0',

    plantuml_server: 'yes',
    plantuml_server_version: 'latest',
    plantuml_host: '192.168.0.203',
    plantuml_port: '80',

    taiga: 'yes',
    taiga_version: 'latest',
    taiga_host: '192.168.0.204',
    taiga_port: '80',

    sonarqube: 'yes',
    sonarqube_version: '7.9.1-community',
    sonarqube_host: '192.168.0.205',
    sonarqube_port: '9000',

#    sonar_scanner_cli_version: '4.2.0.1873',
    sonar_scanner_cli_version: '4.0.0.1744',

    inspec_version: '4.18.39',

    python_container_image: 'yes', 
    python_version: '2.7.17',

    golang_container_image: 'yes',
    golang_sonarqube_scanner_image: 'yes',
    golang_version: '1.13.7',  

    selenium_standalone_chrome_version: '3.141',

    standalone_firefox_container_image: 'yes',
    selenium_standalone_firefox_version: '3.141',

    owasp_zap2docker_stable_image: 'yes',
    zap2docker_stable_version: '2.8.0',

    create_cache: 'yes',

    host_os: (
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        'windows'
      when /darwin|mac os/
        'macosx'
      when /linux/
        'linux'
      when /bsd/
        'unix'
      else
        raise Error, "unknown os: #{host_os.inspect}"
      end
    )
  }

  VARS[:ansible_python_version] = (
   if VARS[:base_box].downcase.include? 'centos' and VARS[:base_box].to_s.include? '7'
     'python2'
   else
     'python3'
   end
  )

  def ConfigurationVars.as_string( http_proxy, https_proxy, ftp_proxy, no_proxy, certs)

    vars = VARS

    vars[:http_proxy] = (!http_proxy ? "" : http_proxy) 
    vars[:https_proxy] = (!https_proxy ? "" : https_proxy)
    vars[:ftp_proxy] = (!ftp_proxy ? "" : ftp_proxy)
    vars[:no_proxy] = (!no_proxy ? "" : no_proxy)

    vars[:CA_CERTIFICATES] = ''

    unless certs.nil? || certs == ''
      vars[:CA_CERTIFICATES] = certs
    end

    vars_string = ''

    vars.each do |key, value|
      if ( ( key == :CA_CERTIFICATES ) && ( !value.nil? ) && value != '' )
        vars_string = vars_string + "\\\"#{key}\\\":\\\["
        value.each { |item|
          vars_string = vars_string + "\\\"#{item}\\\","
        }
        vars_string = vars_string.chop + '\\],'
      else
        if (value.is_a? Integer)
          value = value.to_s
        end
      
        vars_string = vars_string + "\\\"#{key}\\\":\\\"#{value}\\\","
      end
    end

    return '\\{' + vars_string.chop + '\\}'
  end

  DETERMINE_OS_TEMPLATE = <<~SHELL
    os=""
    if [[ $(command -v lsb_release | wc -l) == *"1"* ]]; then 
      os="$(lsb_release -is)-$(lsb_release -cs)"
    elif [ -f "/etc/os-release" ]; then
      if [[ $(cat /etc/os-release | grep -i alpine | wc -l) -gt "0" ]]; then 
        os="Alpine"
      elif [[ $(cat /etc/os-release | grep -i "CentOS Linux 7" | wc -l) -gt "0" ]]; then
        os="CentOS 7"
      fi
    else 
      echo -n "Cannot determine OS."
      exit -1    
    fi
  SHELL

  OS_PACKAGES_FROM_CACHE_TEMPLATE = <<~SHELL

    mkdir -p /tmp/root-cache

    box="#{VARS[:base_box]}"

    case $os in

      "Alpine")
        package_manager="apk"
        ;;

      "Ubuntu-bionic")
        package_manager="apt"
        ;;

      "CentOS 7")
        package_manager="yum"
        ;;

      *)
        echo -n "${os} not supported."
        exit -1
        ;;
    esac

    if [ -f "/vagrant/cache/TYPE/${box}/${package_manager}.tar.gz" ]; then
      update=true

      if [ -f "/tmp/root-cache/${package_manager}.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/${package_manager}.tar.gz"`!=`stat -c%s "/tmp/root-cache/${package_manager}.tar.gz"`)); then
          update=false
        fi
      fi

      if ($update == true); then
        echo Installing ${box} ${package_manager} packages from cache...
        cd /tmp/root-cache
        cp /vagrant/cache/TYPE/${box}/${package_manager}.tar.gz ${package_manager}.tar.gz
        tar zxf ${package_manager}.tar.gz
        if [ -d "${package_manager}" ]; then
          case $os in
            "Alpine")
              echo "installing apk packages from cache..."
              apk add --repositories-file=/dev/null --allow-untrusted --no-network apk/*.apk
              ;;
            "Ubuntu-bionic")
              #echo "installing apt packages from cache..."
              #cd apt/archives
              #dpkg -i ./*.deb
              #apt --fix-broken install
              echo "not yet reliable..."
              ;;
            "CentOS 7")
              mv yum /var/cache/
              ;;

            *)
              echo "${os} not supported." 1>&2
              exit -1
              ;;              
          esac
        fi

        rm -Rf ${package_manager}
      else
        echo No new ${box} packages in cache...
      fi
    else
      echo No cached ${box} packages...
    fi
  SHELL

  INSTALL_ANSIBLE_DEPENDENCIES_TEMPLATE = <<~SHELL
    case $os in
      "Alpine")
        # install Alpine packages
        apk add python3 python3-dev py3-pip musl-dev libffi-dev libc-dev py3-cryptography make gcc libressl-dev
        ;;
      "Ubuntu-bionic")
        apt update
        apt upgrade -y
        apt install -y python3 python3-dev python3-pip make gcc
        ;;
      "CentOS 7")
        yum install -y epel-release
        yum install -y python python-pip make gcc
        ;;
      *)
        echo "${os} not supported." 1>&2
        exit -1
        ;;
    esac
  SHELL

  SITE_PACKAGES_FROM_CACHE_TEMPLATE = <<~SHELL

    if [ -f "/vagrant/cache/TYPE/${box}/site-packages.tar.gz" ]; then
      update=true

      if [ -f "/tmp/root-cache/site-packages.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/site-packages"`!=`stat -c%s "/tmp/root-cache/site-packages"`)); then
          update=false
        fi
      fi

      if ($update == true); then
        echo Unpacking #{ VARS[:ansible_python_version] } site-packages from cache...
        cd /tmp/root-cache
        cp /vagrant/cache/TYPE/${box}/site-packages.tar.gz site-packages.tar.gz
        cd /usr/lib/#{ VARS[:ansible_python_version] }*
        tar zxvf /tmp/root-cache/site-packages.tar.gz
      else
        echo No new updates to site-packages in cache...
      fi
    fi
  SHELL

  USER_CACHED_CONTENT_TEMPLATE = <<~SHELL
    mkdir -p /tmp/vagrant-cache

    box="#{VARS[:base_box]}"

    if [ "${os}" == "CentOS 7" ] && [ -f "/vagrant/cache/TYPE/${box}/rvm.tar.gz" ]; then
      update=true

      if [ -f "/tmp/vagrant-cache/rvm.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/rvm.tar.gz"`!=`stat -c%s "/tmp/vagrant-cache/rvm.tar.gz"`)); then
          update=false
        fi
      fi

      if ($update == true); then
        echo Unpacking /home/vagrant/[.rvm .gnupg .bash_profile .bashrc .profile .mkshrc .zshrc .zlogin] from cache...
        cp /vagrant/cache/TYPE/${box}/rvm.tar.gz /tmp/vagrant-cache/rvm.tar.gz
        cd /home/vagrant/
        tar zxvf /tmp/vagrant-cache/rvm.tar.gz
      else
        echo No new updates to /home/vagrant/[.rvm .gnupg .bash_profile .bashrc .profile .mkshrc .zshrc .zlogin] in cache...
      fi
    else
      echo No /home/vagrant/[.rvm .gnupg .bash_profile .bashrc .profile .mkshrc .zshrc .zlogin] in cache...
    fi

    if [ -f "/vagrant/cache/TYPE/${box}/cache.tar.gz" ]; then
      update=true

      if [ -f "/tmp/vagrant-cache/cache.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/cache.tar.gz"`!=`stat -c%s "/tmp/vagrant-cache/cache.tar.gz"`)); then
          update=false
        fi
      fi

      if ($update == true); then
        echo Unpacking /home/vagrant/.cache from cache...
        cp /vagrant/cache/TYPE/${box}/cache.tar.gz /tmp/vagrant-cache/cache.tar.gz
        cd /home/vagrant/
        tar zxvf /tmp/vagrant-cache/cache.tar.gz
      else
        echo No new updates to /home/vagrant/.cache in cache...
      fi
    else
      echo No /home/vagrant/.cache cache...
    fi

    if [ -f "/vagrant/cache/TYPE/${box}/local.tar.gz" ]; then
      update=true

      if [ -f "/tmp/vagrant-cache/local.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/local.tar.gz"`!=`stat -c%s "/tmp/vagrant-cache/local.tar.gz"`)); then
          update=false
        fi
      fi

      if ($update == true); then
        echo Unpacking /home/vagrant/.local from cache...
        cp /vagrant/cache/TYPE/${box}/local.tar.gz /tmp/vagrant-cache/local.tar.gz
        cd /home/vagrant/
        tar -zxvf /tmp/vagrant-cache/local.tar.gz
      else
        echo No new updates to /home/vagrant/.local in cache...
      fi
    else
      echo No /home/vagrant/.local cache...
    fi

    if [ -f "/vagrant/cache/TYPE/${box}/gem.tar.gz" ]; then
      update=true

      if [ -f "/tmp/vagrant-cache/gem.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/gem.tar.gz"`!=`stat -c%s "/tmp/vagrant-cache/gem.tar.gz"`)); then
          update=false
        fi
      fi

      if ($update == true); then
        echo Unpacking /home/vagrant/.gem from cache...
        cp /vagrant/cache/TYPE/${box}/gem.tar.gz /tmp/vagrant-cache/gem.tar.gz
        cd /home/vagrant
        tar -zxvf /tmp/vagrant-cache/gem.tar.gz
      else
        echo No new updates to /home/vagrant/.gem in cache...
      fi
    else
      echo No /home/vagrant/.gem cache...
    fi
  SHELL
end
