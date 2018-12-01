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

# Example values chage for your environment...

unset PROXY
unset proxy
unset https_proxy
unset http_proxy
unset HTTP_PROXY
unset ALL_PROXY
unset NO_PROXY
unset no_proxy
export CA_CERTIFICATES=http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20ROOT.crt,http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20NPE%20CA-3%281%29.crt
export VAGRANT_ALLOW_PLUGIN_SOURCE_ERRORS=0
