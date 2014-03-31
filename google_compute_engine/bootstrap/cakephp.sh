#!/bin/bash

##
# Create all temp folders
##

mkdir -p /usr/share/nginx/html/app/tmp/cache/models
mkdir -p /usr/share/nginx/html/app/tmp/cache/persistent
mkdir -p /usr/share/nginx/html/app/tmp/logs/persistent

chmod -R ugo+rwx /usr/share/nginx/html/app/tmp
