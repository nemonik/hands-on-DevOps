#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

set -e

# remove prior nemonik/alpine310 box file
rm -f ./nemonik_alpine310.box || true

if [[ ! -z "${HTTP_PROXY}" ]]; then
  echo "setting PROXYOPTS to \"${HTTP_PROXY}\" in http/answers"
  sed -i.bak 's@^PROXYOPTS.*@PROXYOPTS="'"$HTTP_PROXY"'"@' http/answers
else 
  echo "setting PROXYOPTS to "none" in http/answers"
  sed -i.bak 's@^PROXYOPTS.*@PROXYOPTS="none"@' http/answers
fi

echo "building nemonik_alpine310.box via packer"
packer build -force alpine310.json

if [ -f "./nemonik_alpine310.box" ]; then
  echo "adding nemonik_alpine310.box"
  n=0;until [ $n -ge 5 ]; do vagrant box add nemonik/alpine310 nemonik_alpine310.box && break; n=$[$n+1]; sleep 15; done;
  rm -Rf $tmp_dir
fi
