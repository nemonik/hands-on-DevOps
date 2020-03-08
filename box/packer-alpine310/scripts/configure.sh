#!/bin/sh -ux

#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

rc-update -u 

setup-apkcache

apk update

apk upgrade -U --available

apk add -U bash bash-completion sudo curl

echo http://dl-cdn.alpinelinux.org/alpine/v3.10/community >> /etc/apk/repositories
#apk add -U virtualbox-guest-additions virtualbox-guest-modules-vanilla
apk add -U virtualbox-guest-additions virtualbox-guest-modules-virt
rc-update add virtualbox-guest-additions
echo vboxsf >> /etc/modules

echo "UseDNS no" >> /etc/ssh/sshd_config 

adduser -D vagrant
echo "vagrant:vagrant" | chpasswd

mkdir -pm 700 /home/vagrant/.ssh
chown -R vagrant:vagrant /home/vagrant/.ssh

wget -O /home/vagrant/.ssh/authorized_keys 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 644 /home/vagrant/.ssh/authorized_keys

adduser vagrant wheel

echo "Defaults exempt_group=wheel" > /etc/sudoers
echo "%wheel ALL=NOPASSWD:ALL" >> /etc/sudoers


sed -i.bak 's@/ash$@/bash@g' /etc/passwd
rm /etc/passwd.bak

echo "" > /etc/motd

rm -Rf /var/cache/apk/*
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
cat /dev/null > ~/.bash_history
history -c
sync
sync
sync

exit 0
