#!/bin/bash

PAPERTRAILPORT=$(curl http://metadata/0.1/meta-data/attributes/papertrail-port)

echo "*.*          @logs.papertrailapp.com:$PAPERTRAILPORT" >> /etc/rsyslog.conf

/etc/init.d/rsyslog restart

echo "installing Ruby"
curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3

sudo gem install remote_syslog

touch ~/.bash_profile

echo "source /usr/local/rvm/scripts/rvm" >> ~/.bash_profile

wget -O /etc/init.d/remote_syslog "https://raw.githubusercontent.com/papertrail/remote_syslog2/master/examples/remote_syslog.init.d"

update-rc.d remote_syslog defaults

remote_syslog -p $PAPERTRAILPORT -d logs.papertrailapp.com /var/log/nginx/error.log /var/log/php-fpm/error.log /var/log/php-fpm/cronoutput.log /var/log/php-fpm/cron 
