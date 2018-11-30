#!/usr/bin/env bash

# run in shell via
# 
# ```
# . ./set_env_with_proxy.sh
# ```

export PROXY=http://gatekeeper.mitre.org:80
export proxy=$PROXY
export https_proxy=$PROXY
export http_proxy=$PROXY
export HTTP_PROXY=$PROXY
export ALL_PROXY=$PROXY
export NO_PROXY="127.0.0.1,localhost,.mitre.org,.local,$(echo 192.168.0.{1..255} | sed 's/ /,/g')"
export no_proxy=${NO_PROXY}

export CA_CERTIFICATES=http://pki.mitre.org/MITRE%20BA%20ROOT.crt,http://pki.mitre.org/MITRE%20BA%20NPE%20CA-1.crt,http://pki.mitre.org/MITRE%20BA%20NPE%20CA-3.crt
