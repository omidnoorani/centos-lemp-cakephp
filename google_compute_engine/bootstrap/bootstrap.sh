#!/bin/bash

# Disable the firewall
service iptables stop
chkconfig iptables off
service iptables6 stop
chkconfig iptables6 off

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
