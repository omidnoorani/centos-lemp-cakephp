#!/bin/bash

##
# Create all temp folders
##

mkdir -p /usr/share/nginx/html/app/tmp/cache/{models,persistent}
mkdir -p /usr/share/nginx/html/app/tmp/logs/

chmod -R ugo+rwx /usr/share/nginx/html/app/tmp
chmod -R g+w /usr/share/nginx/html/app
chown -R www:www /usr/share/nginx/html/app
