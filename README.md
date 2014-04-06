Provisioning our server stack
===================

Various projects at Label305 use the scripts in this repository to provision development and production environments. For example the `Vagrantfile` in a projects repository root will download their basebox from this repository and execute the base provisioning script `vagrant\bootstrap\bootstrap.sh` from this repo.

The stack
----

* Vagrant (Development) / Google Compute Engine (Production)
* CentOS
* nginx
* PHP-FPM
* memcache
* MySQL (Development) / Google Cloud SQL (Production)
* CakePHP

The tools
----

* [Deploy](http://deployhq.com) for deployments
* [New Relic](http://newrelic.com) for server monitoring
