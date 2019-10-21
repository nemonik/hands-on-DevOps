#!/bin/bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

set -e

time {

  if [[ $(vagrant box list | grep nemonik/devops | wc -c) -eq 0 ]]; then

    # remove prior nemonik/devops box
    rm -f ./virtualbox-devops.box
    vagrant destroy --force default || true 

    # build nemonik/devops box
    echo "Building nemonik/devops box via Vagrant..."
    vagrant up
    vagrant package --output ./virtualbox-devops.box
    echo "Ignore error messages, this step will retry..."
    n=0;until [ $n -ge 5 ]; do vagrant box add nemonik/devops ./virtualbox-devops.box && break; n=$[$n+1]; sleep 15; done;

    #clean up
    vagrant destroy --force default

  else
    echo "Not creating nemonik/devops box as it already exists."
  fi
}
