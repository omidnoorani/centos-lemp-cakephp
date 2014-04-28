#!/bin/bash

# Execute the normal bootstrap script
curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/vagrant/bootstrap/bootstrap.sh | bash

echo "Installing PHP Unit"
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit-3.7.30
 
echo "Installing Composer"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/vagrant
