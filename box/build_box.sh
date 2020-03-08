#!/bin/bash

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

set -e

time {

  # pull base_box defined in ../configuration_vars.rb
  base=$(cat ../configuration_vars.rb | grep -w '^ *base_box')

  if [[ ! -z $base ]]; then
    IFS="'" read -r -a parts <<< "$base"

    base="${parts[1]}"

    IFS='/' read -r -a parts <<< "$base"

    os="${parts[1]}"
  else 
    echo "VAR[:base_box] in ../configuration_vars.rb not set!" 1>&2
    exit 64
  fi

  # base boxes starting with "nemonik" are custom built with packer
  if [[ $(echo "${base}" | grep "nemonik" | wc -l) -eq 1 ]]; then
    # is the box already built and added to vagrant locally?
    if [[ $(vagrant box list | grep $base | wc -l) -eq 0  ]]; then
      # execute the correct packer build

      path="packer-${os}"

      cd $path

      ./build_box.sh -release
    else
      echo "Not creating packer $base box as it already exists."
    fi
  else 
    echo "$base base box is not built via packer, so no need to build it." 
  fi

  if [[ $(vagrant box list | grep "nemonik/devops_${os}" | wc -l) -eq 0 ]]; then

    vagrant destroy --force default || true 

    # remove prior nemonik/devops_${os} box file
    rm -f ./nemonik_devops_${os}.box

    # build nemonik/devops box
    echo "Building nemonik/devops_${os} box via Vagrant..."
    vagrant up
    vagrant package --output ./nemonik_devops_${os}.box
    echo "Ignore error messages, this step will retry..."
    n=0;until [ $n -ge 5 ]; do vagrant box add nemonik/devops_${os} ./nemonik_devops_${os}.box && break; n=$[$n+1]; sleep 15; done;

    #clean up
    vagrant destroy --force default
  else
    echo "Not creating nemonik/devops_${os} box as it already exists."
  fi
}
