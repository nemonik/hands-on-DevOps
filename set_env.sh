#!/usr/bin/env bash

# Copyright (C) 2018 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# run in shell via
# 
# ```
# . ./set_env.sh
# ```

export PROXY=http://gatekeeper.mitre.org:80
export proxy=$PROXY
export https_proxy=$PROXY
export http_proxy=$PROXY
export HTTP_PROXY=$PROXY
export ALL_PROXY=$PROXY
export NO_PROXY="127.0.0.1,localhost,.mitre.org,.local,$(echo 192.168.0.{1..255} | sed 's/ /,/g')"
export no_proxy=${NO_PROXY}
export CA_CERTIFICATES=https://raw.githubusercontent.com/nemonik/hands-on-DevOps/master/certs/MITRE%20BA%20NPE%20CA-3%281%29.crt,https://raw.githubusercontent.com/nemonik/hands-on-DevOps/master/certs/MITRE%20BA%20ROOT.crt
export VAGRANT_ALLOW_PLUGIN_SOURCE_ERRORS=0
