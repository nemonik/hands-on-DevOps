#!/bin/bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

rm -f ./devops.box
vagrant destroy --force default
vagrant box remove nemonik/devops
vagrant up
echo 
echo "Ignore the above error. CentOS nuked http://vault.centos.org/7.7.1908/os/x86_64/ at 2019-09-17 12:22"
echo
vagrant ssh -- -t 'sudo yum -y update'
vagrant halt
vagrant up --provision
vagrant package --output ./devops.box
vagrant box add nemonik/devops ./devops.box
vagrant destroy --force default
