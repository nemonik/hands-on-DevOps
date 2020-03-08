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
  base=$(cat ../configuration_vars.rb | grep -w '^\s.*base_box: ')

  if [[ ! -z $base ]]; then
    IFS="'" read -r -a parts <<< "$base"

    base="${parts[1]}"

    IFS='/' read -r -a parts <<< "$base"

    os="${parts[1]}"

  else
    echo "VAR[:base_box] in ../configuration_vars.rb not set!" 1>&2
    exit 64
  fi

  # remove prior nemonik/devops box file
  rm -f ./nemonik_devops_${os}.box

  if [[ $(vagrant box list | grep nemonik/devops_${os} | wc -l) -eq 1 ]]; then  
    vagrant destroy --force default || true 
    vagrant box remove -f nemonik/devops_${os} || true
  fi

}
