#!/bin/bash

# Disable the firewall
service iptables stop
chkconfig iptables off
service iptables6 stop
chkconfig iptables6 off

# Adding epel repository
cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
enabled=1
gpgcheck=0
EOM

# Adding specific epel repository
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Installing Tool packages
yum -y install wget htop git curl vim

# Execute NGINX setup
curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/bootstrap/nginx.sh | bash

chmod -R g+rw /usr/share/nginx/html
chown -R www:www /usr/share/nginx

# Execute Deploy user setup
curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/deploy.sh | bash

# Setup Newrelic
curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/newrelic.sh | bash

# Setup Cakephp
curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/cakephp.sh | bash
