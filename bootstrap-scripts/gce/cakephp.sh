#!/bin/bash

##
# Create all temp folders
##

mkdir -p /usr/share/nginx/html/admin/tmp/cache/models
mkdir -p /usr/share/nginx/html/admin/tmp/cache/persistent
mkdir -p /usr/share/nginx/html/admin/tmp/logs/persistent
mkdir -p /usr/share/nginx/html/training/tmp/cache/models
mkdir -p /usr/share/nginx/html/training/tmp/cache/persistent
mkdir -p /usr/share/nginx/html/training/tmp/logs/persistent
mkdir -p /usr/share/nginx/html/core/tmp/cache/models
mkdir -p /usr/share/nginx/html/core/tmp/cache/persistent
mkdir -p /usr/share/nginx/html/core/tmp/logs/persistent

chmod -R ugo+rwx /usr/share/nginx/html/admin/tmp
chmod -R ugo+rwx /usr/share/nginx/html/training/tmp
chmod -R ugo+rwx /usr/share/nginx/html/core/tmp
