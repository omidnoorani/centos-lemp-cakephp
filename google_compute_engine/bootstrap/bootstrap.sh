#!/bin/bash

# Disable the firewall
service iptables stop
chkconfig iptables off

# Execute NGINX setup
curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/bootstrap/nginx.sh | bash

chmod -R g+rw /usr/share/nginx/html
chown -R www:www /usr/share/nginx

# Heartbleed bug fix http://heartbleed.com/
yum update -y openssl

# Execute Deploy user setup
curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/deploy.sh | bash

# Setup Newrelic
curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/newrelic.sh | bash

# Setup Cakephp
curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/cakephp.sh | bash

# Disabled Setup Loggly
# curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/google_compute_engine/bootstrap/loggly.sh | bash

# Show the versions of important software
cat /etc/redhat-release
nginx -v
php-fpm -v

echo ""
echo "Google Compute Engine provisioning done!"
