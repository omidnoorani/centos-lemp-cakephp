#!/bin/bash

##
# Make sure the "newrelic-license" metadata key is set.
##

NEWRELIC_LICENSE=$(curl http://metadata/0.1/meta-data/attributes/newrelic-license)

rpm -Uvh http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm

yum install -y newrelic-sysmond

nrsysmond-config --set license_key=$NEWRELIC_LICENSE

/etc/init.d/newrelic-sysmond start
