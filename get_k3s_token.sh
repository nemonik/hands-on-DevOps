#!/usr/bin/env bash

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# Returns the K3s server node-token

ssh-keygen -R 192.168.0.10 &> /dev/null
ssh -t -o StrictHostKeyChecking=no -i ~/.vagrant.d/insecure_private_key -l vagrant 192.168.0.10 'source $HOME/.bash_profile && /home/vagrant/kubernetes-dashboard/get_token.sh'

#vagrant ssh master -- -t '/home/vagrant/kubernetes-dashboard/get_token.sh'
