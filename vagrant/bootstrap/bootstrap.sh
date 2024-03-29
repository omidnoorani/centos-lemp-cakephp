#!/bin/bash

# Execute NGINX setup
curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/bootstrap/nginx.sh | bash

# Disable sendfile
# sendfile results in caching problems on VirtualBox
# http://abitwiser.wordpress.com/2011/02/24/virtualbox-hates-sendfile/
sed -i "s/^.*sendfile on;/sendfile off;/" /etc/nginx/nginx.conf
service nginx reload # reload the new config

# This part of the script symlinks the /usr/share/nginx/html
# to the /vagrant shared folder.
rm -rf /usr/share/nginx/html
ln -fs /vagrant /usr/share/nginx/html

# Execute MySQL setup
curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/vagrant/bootstrap/mysql.sh | bash

# Show the versions of important software
cat /etc/redhat-release
nginx -v
php-fpm -v
mysql -V

echo ""
echo "Vagrant provisioning done!"
