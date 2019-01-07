#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

vagrant up toolchain
vagrant ssh toolchain --command "sudo yum install -y kernel-devel kernel-devel-\$(uname -r) && sudo yum update -y"
vagrant reload toolchain
