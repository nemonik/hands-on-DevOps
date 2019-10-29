#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
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
#
# will set proxy setting to the the hard-cded value on line 36.
# Modify for your environment.
#
# ```
# . ./set_env.sh no_proxy
# ```
#
# will unset all proxy related environmental variables.

set_proxy=true

if [ $# -ne 0 ]; then
  args=("$@")
  if [[ $args[1] = "no_proxy" ]]; then
    echo "setting proxy to false"
    set_proxy=false
  fi
fi

if [[ $set_proxy = true ]]; then  
  export PROXY=http://gatekeeper.mitre.org:80
  export proxy=$PROXY
  export HTTP_PROXY=$PROXY
  export http_proxy=$PROXY
  export HTTPS_PROXT=$PROXY
  export https_proxy=$PROXY
  export ALL_PROXY=$PROXY
  export NO_PROXY="127.0.0.1,localhost,.mitre.org,.local,192.168.0.10,192.168.0.11"
 export no_proxy=$NO_PROXY
else
  unset PROXY
  unset proxy
  unset HTTP_PROXY
  unset http_proxy
  unset HTTPS_PROXY
  unset https_proxy
  unset NO_PROXY
  unset no_proxy
  unset ALL_PROXY
fi

export CA_CERTIFICATES=http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20ROOT.crt,http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20NPE%20CA-3%281%29.crt
export VAGRANT_ALLOW_PLUGIN_SOURCE_ERRORS=0

# Force the use of the vagrant cacert.pem file
unset CURL_CA_BUNDLE
unset SSL_CERT_FILE
