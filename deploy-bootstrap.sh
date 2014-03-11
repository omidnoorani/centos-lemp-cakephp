#!/bin/bash

##
# Google Cloud bootstrap script
#
# Can be used to bootstrap a minimal CentOS machine to be used
# for a CakePHP application in the Google Compute Engine cloud
#
# You should have set the "deploy-hq-key" metadata
# 
# Script by Thijs Scheepers
# Copyright 2013 Label305 B.V. All rights reserved.
##

##
# SETUP DEPLOY USERS FOR DEPLOYHQ
##

DEPLOY_HQ_KEY=$(curl http://metadata/0.1/meta-data/attributes/deploy-hq-key)

useradd -m -G www deploy # setup user

mkdir /home/deploy/.ssh
chmod 700 /home/deploy/.ssh

echo "NO KEY" > /home/deploy/.ssh/authorized_keys

chmod 400 /home/deploy/.ssh/authorized_keys
chown deploy:deploy /home/deploy -R

echo deploy:$1 | chpasswd
echo "deploy ALL=NOPASSWD: ALL" >> /etc/sudoers

echo $DEPLOY_HQ_KEY > /home/deploy/.ssh/authorized_keys

echo "Deploy user created with authorized key:"
echo $DEPLOY_HQ_KEY
