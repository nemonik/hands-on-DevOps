#!/bin/bash

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

set -e

time {

  # remove prior nemonik/alpine310 box file
  rm -vf ./nemonik_alpine310.box

  if [[ $(vagrant box list | grep nemonik/alpine310 | wc -l) -eq 1  ]]; then
    vagrant box remove -f nemonik/alpine310 || true
  fi

}
