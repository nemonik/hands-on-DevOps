#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# Returns the K3s server node-token

vagrant ssh toolchain -- -t 'sudo watch -n 2 kubectl --all-namespaces=true get pods' 
