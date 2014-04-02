#!/bin/bash

##
# Vagrant bootstrap script
#
# Can be used to bootstrap a minimal CentOS machine to be used
# for a CakePHP application
# 
# Script by Thijs Scheepers
# Copyright 2013 Label305 B.V. All rights reserved.
##

yum install mysql mysql-server -y

##
# SETUP MYSQL
#
# We create a vagrant mysql user with a simple password
# It deletes the anonymous user and disables remote root access
##

chkconfig --levels 235 mysqld on
service mysqld start

mysql -u root <<"EOF"
GRANT ALL PRIVILEGES ON *.* TO vagrant@'%.%.%.%' IDENTIFIED BY "vagrantmysqlpassword" WITH GRANT OPTION;
DROP DATABASE test;
DELETE FROM mysql.user WHERE User='root' AND Host!='localhost';
DELETE FROM mysql.user WHERE User='';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root password 'vagrantmysqlpassword'

echo "MySQL 'vagrant' user created with password 'vagrantmysqlpassword'"
