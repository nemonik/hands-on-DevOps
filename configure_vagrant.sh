#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# set ca_certificates env variable if needed.
#
# then run in shell via
# 
# ```
# sudo -E bash -c ./configure_vagrant.sh
# ```

echo "Must run as `sudo -E bash -c ./configure_vagrant.sh`"

env 

if [ -n "$CA_CERTIFICATES" ]; then

  cp /opt/vagrant/embedded/cacert.pem /opt/vagrant/embedded/cacert.pem.back

  IFS=","

  arr=($CA_CERTIFICATES)

  for i in "${!arr[@]}"; do
    echo " curl --insecure -sS ${arr[$i]} >> /opt/vagrant/embedded/cacert.pem"
    curl --insecure -sS ${arr[$i]} >> /opt/vagrant/embedded/cacert.pem
  done

  unset IFS

else
  echo "CA_CERTIFICATES environmental variable is not set"
fi

vagrant plugin install vagrant-certificates
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-disksize
vagrant plugin install vagrant-proxyconf
vagrant plugin install vagrant-vbguest
