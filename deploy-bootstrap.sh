#!/bin/bash

##
# Vagrant bootstrap script
#
# Can be used to bootstrap a minimal CentOS machine to be used
# for a CakePHP application
# 
# Script by Thijs Scheepers
# Copyright 2013 Label305 B.V. All rights reserved.
##

##
# SETUP DEPLOY USERS
##

useradd -m -G www deploy # setup user

mkdir /home/deploy/.ssh
chmod 700 /home/deploy/.ssh

echo "NO KEY" > /home/deploy/.ssh/authorized_keys

chmod 400 /home/deploy/.ssh/authorized_keys
chown deploy:deploy /home/deploy -R

echo deploy:$1 | chpasswd
echo "deploy ALL=NOPASSWD: ALL" >> /etc/sudoers

echo "Deploy user created"
