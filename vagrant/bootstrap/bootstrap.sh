#!/bin/bash

# Execute NGINX setup
curl -s https://raw.github.com/Label305/vagrant-centos/master/bootstrap/nginx.sh | bash

# This part of the script symlinks the /usr/share/nginx/html
# to the /vagrant shared folder.
rm -rf /usr/share/nginx/html
ln -fs /vagrant /usr/share/nginx/html

cat > /usr/share/nginx/html/app/webroot/phpinfo.php <<"EOF"
<?php
// Created by Vagrant bootstrap script
	phpinfo();
?>
EOF

echo "Don't forget got add the following line to your Vagrantfile:"
echo "config.vm.synced_folder './', '/vagrant', :owner=> 'vagrant', :group=>'www', :mount_options => ['dmode=775', 'fmode=775']"
echo ""

# Execute MySQL setup
curl -s https://raw.github.com/Label305/vagrant-centos/master/vagrant/bootstrap/mysql.sh | bash
