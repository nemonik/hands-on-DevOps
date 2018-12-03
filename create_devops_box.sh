#!/usr/bin/env bash

# Copyright (C) 2018 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

PROJECT_ROOT=`pwd`
TEMP=`mktemp -d -t devops`
cd ${TEMP}
vagrant init centos/7
vagrant up
vagrant ssh --command "sudo yum update -y"
vagrant ssh --command "sudo yum clean all"
vagrant package --output devops.box
vagrant destroy -f
cp -f ./devops.box ${PROJECT_ROOT}/.
rm -Rf ${TEMP}
cd ${PROJECT_ROOT}
