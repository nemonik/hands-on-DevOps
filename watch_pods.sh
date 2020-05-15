#!/usr/bin/env bash

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# Returns the K3s server node-token

# `vagrant ssh` presently seems buggy

ssh-keygen -R 192.168.0.10
ssh -t -o StrictHostKeyChecking=no -i ~/.vagrant.d/insecure_private_key -l vagrant 192.168.0.10 'sudo watch -c -d -n 5 /usr/local/bin/kubectl --all-namespaces=true get pods -o wide'
