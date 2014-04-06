#!/bin/bash

# Execute NGINX setup
curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/bootstrap/nginx.sh | bash

# Disable sendfile
# sendfile results in caching problems on VirtualBox
# http://abitwiser.wordpress.com/2011/02/24/virtualbox-hates-sendfile/
sed -i "s/^.*sendfile on;/sendfile off;/" /etc/nginx/nginx.conf
service nginx reload # reload the new config

# This part of the script symlinks the /usr/share/nginx/html
# to the /vagrant shared folder.
rm -rf /usr/share/nginx/html
ln -fs /vagrant /usr/share/nginx/html

echo "Don't forget got add the following line to your Vagrantfile:"
echo "config.vm.synced_folder './', '/vagrant', :owner=> 'vagrant', :group=>'www', :mount_options => ['dmode=775', 'fmode=775']"
echo ""

# Execute MySQL setup
curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/vagrant/bootstrap/mysql.sh | bash
