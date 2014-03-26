#!/bin/bash

# Disable the firewall
service iptables stop
chkconfig iptables off

# UPDATING ALL SOFTWARE
yum update yum -y

# Execute NGINX setup
curl -s https://raw.github.com/Label305/vagrant-centos/master/bootstrap-scripts/general/nginx.sh | bash

chmod -R g+rw /usr/share/nginx/html
chown -R www:www /usr/share/nginx

# Execute Deploy user setup
curl -s https://raw.github.com/Label305/vagrant-centos/master/bootstrap-scripts/gce/deploy.sh | bash

# Setup Newrelic
curl -s https://raw.github.com/Label305/vagrant-centos/master/bootstrap-scripts/gce/newrelic.sh | bash

# Setup Cakephp
curl -s https://raw.github.com/Label305/vagrant-centos/master/bootstrap-scripts/gce/cakephp.sh | bash
