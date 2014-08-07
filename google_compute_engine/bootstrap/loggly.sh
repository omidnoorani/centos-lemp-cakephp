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

HTTPCODE=$(curl --write-out %{http_code} --silent --output /dev/null http://metadata/0.1/meta-data/attributes/loggly-subdomain)

if [ $HTTPCODE = "200" ]; then

  LOGGLY_SUBDOMAIN=$(curl http://metadata/0.1/meta-data/attributes/loggly-subdomain)
  LOGGLY_TOKEN=$(curl http://metadata/0.1/meta-data/attributes/loggly-token)
  LOGGLY_USER=$(curl http://metadata/0.1/meta-data/attributes/loggly-user)
  LOGGLY_PASSWORD=$(curl http://metadata/0.1/meta-data/attributes/loggly-password)
  
  echo 0 >/selinux/enforce
  
  curl -O https://www.loggly.com/install/configure-linux.sh 
  echo "Executing: bash configure-linux.sh -a $LOGGLY_SUBDOMAIN -t $LOGGLY_TOKEN -u $LOGGLY_USER -p $LOGGLY_PASSWORD"
  bash configure-linux.sh -a $LOGGLY_SUBDOMAIN -t $LOGGLY_TOKEN -u $LOGGLY_USER -p $LOGGLY_PASSWORD
  
  #nginx nginx.conf
  cat > /etc/rsyslog.d/21-nginx-loggly.conf <<"EOF"
$ModLoad imfile
$InputFilePollInterval 10 
$PrivDropToGroup adm
$WorkDirectory /var/spool/rsyslog

# Nginx access file:
$InputFileName /var/log/nginx/access.log
$InputFileTag nginx-access:
$InputFileStateFile stat-nginx-access
$InputFileSeverity info
$InputFilePersistStateInterval 20000
$InputRunFileMonitor

#Nginx Error file: 
$InputFileName /var/log/nginx/error.log
$InputFileTag nginx-error:
$InputFileStateFile stat-nginx-error
$InputFileSeverity error
$InputFilePersistStateInterval 20000
$InputRunFileMonitor

#Add a tag for nginx events
$template LogglyFormatNginx,"<%pri%>%protocol-version% %timestamp:::date-rfc3339% %HOSTNAME% %app-name% %procid% %msgid% [d4208620-e22e-47bb-8b56-e5731c62e042@41058 tag=\"nginx\"] %msg%\n"

if $programname == 'nginx-access' then @@logs-01.loggly.com:514;LogglyFormatNginx
if $programname == 'nginx-access' then ~
if $programname == 'nginx-error' then @@logs-01.loggly.com:514;LogglyFormatNginx
if $programname == 'nginx-error' then ~
EOF
  
  sed -i "s/;error_log = syslog/error_log = syslog/" /etc/php.ini
  
  service rsyslog restart
  
  echo "Loggly enabled"
  
else 
  echo "Loggly not setup in the metadata"
fi

