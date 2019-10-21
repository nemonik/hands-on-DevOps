#!/bin/bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

set -e

time {

  # remove prior nemonik/devops box
  rm -f ./virtualbox-devops.box
  vagrant destroy --force default || true 
  vagrant box remove -f nemonik/devops || true

}
