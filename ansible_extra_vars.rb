# -*- mode: ruby -*-
# vi: set ft=ruby :

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

module AnsibleExtraVars

  # Define extra_vars for Ansible
  ANSIBLE_EXTRA_VARS = {

      ansible_version: '2.9.1',

      default_retries: '60',
      default_delay: '5',

      docker_timeout: '300',
      docker_retries: '60',
      docker_delay: '5',

      k3s_version: 'v1.0.0',
      k3s_flannel_iface: 'eth1',
      k3s_cluster_secret: 'kluster_secret',

      kubernetes_dashboard_version: 'v2.0.0-beta6',

      traefik_version: '1.7.19',

      kompose_version: '1.18.0',

      docker_compose_version: '1.24.1',
      docker_compose_pip_version: '1.25.0rc2',

      registry_deploy_via: 'docker-compose',
      registry_version: '2.7.1',
      registry_port: '5000',

      taiga_deploy_via: 'kubectl',
      taiga_version: 'latest',
      taiga_port: '8080',

      gitlab_deploy_via: 'kubectl',
      gitlab_version: '12.5.2',
      gitlab_port: '10080',
      gitlab_ssh_port: '10022',
      gitlab_user: 'root',

      drone_deploy_via: 'docker-compose',
      drone_version: '1.6.2',
      drone_port: '80',

      drone_cli_version: '1.1.0',

      plantuml_deploy_via: 'kubectl',
      plantuml_server_version: 'latest',
      plantuml_port: '8081',

      sonarqube_deploy_via: 'kubectl',
      sonarqube_version: '7.9.1-community',
      sonarqube_port: '9000',

      sonar_scanner_cli_version: '4.0.0.1744',

      inspec_version: '4.16.0',

      python_version: '2.7.17',

      golang_version: '1.13.4',

      selenium_standalone_chrome_version: '3.141',
      selenium_standalone_firefox_version: '3.141',

      zap2docker_stable_version: '2.8.0',
    }

  def AnsibleExtraVars.as_string( http_proxy, https_proxy, ftp_proxy, no_proxy, certs, nameservers )

    ansible_extra_vars = ANSIBLE_EXTRA_VARS

    ansible_extra_vars[:http_proxy] = (!http_proxy ? "" : http_proxy) 
    ansible_extra_vars[:https_proxy] = (!https_proxy ? "" : https_proxy)
    ansible_extra_vars[:ftp_proxy] = (!ftp_proxy ? "" : ftp_proxy)
    ansible_extra_vars[:no_proxy] = (!no_proxy ? "" : no_proxy)
    ansible_extra_vars[:nameservers] = (!nameservers ? "" : nameservers )

    ansible_extra_vars[:CA_CERTIFICATES] = ''

    unless certs.nil? || certs == ''
      ansible_extra_vars[:CA_CERTIFICATES] = certs
    end

    ansible_extra_vars_string = ''

    ansible_extra_vars.each do |key, value|
      if ( ( key == :CA_CERTIFICATES ) && ( !value.nil? ) && value != '' )
        ansible_extra_vars_string = ansible_extra_vars_string + "\\\"#{key}\\\":\\\["
        value.each { |item|
          ansible_extra_vars_string = ansible_extra_vars_string + "\\\"#{item}\\\","
        }
        ansible_extra_vars_string = ansible_extra_vars_string.chop + '\\],'
      else
        ansible_extra_vars_string = ansible_extra_vars_string + "\\\"#{key}\\\":\\\"#{value}\\\","
      end
    end

    return '\\{' + ansible_extra_vars_string.chop + '\\}'
  end
end
