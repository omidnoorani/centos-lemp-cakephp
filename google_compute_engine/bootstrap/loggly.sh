#!/bin/bash

##
# Google Cloud bootstrap script
#
# Can be used to bootstrap a minimal CentOS machine to be used
# for a CakePHP application in the Google Compute Engine cloud
# 
# Script by Thijs Scheepers
# Copyright 2013 Label305 B.V. All rights reserved.
##

##
# SETUP AND INSTALL LOGGLY
##

$LOGGLY_TOKEN=$(curl http://metadata/0.1/meta-data/attributes/loggly-token)

curl -O https://www.loggly.com/install/configure-linux.sh 
sudo bash configure-linux.sh -a label305 -t $LOGGLY_TOKEN -u tscheepers
