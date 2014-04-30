#!/bin/bash

##
# Create all temp folders
##

mkdir -p /usr/share/nginx/html/app/tmp/{cache,logs}/{models,persistent}

chmod -R ugo+rwx /usr/share/nginx/html/app/tmp

chown -R www:www /var/lib/nginx # to allow file uploading to work
