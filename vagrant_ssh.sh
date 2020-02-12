#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

#
# Sometime `vagrant ssh` just stops working for a period of time and then works again, but this
# seems to always work.  Go figure.
#
# Usage:
#
#   ./vagrant_ssh.sh [hostname]
#
#   Where [hostname] is master, node1, development

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters.  Need to pass a host (i.e., master, node1, development)."
fi

if [[ "${@}" == "master" ]]; then
  ip="192.168.0.10" 
else
  ssh-keygen -R 192.168.0.10
  ip=$(ssh -o StrictHostKeyChecking=no -i ~/.vagrant.d/insecure_private_key -l vagrant 192.168.0.10 cat /etc/hosts | grep $@)

  IFS=' ' read -ra parts <<< "${ip}"

  ip="${parts[0]}"
fi

echo "sshing into ${ip}"

ssh-keygen -R $ip
ssh -t -o StrictHostKeyChecking=no -i ~/.vagrant.d/insecure_private_key -l vagrant $ip
