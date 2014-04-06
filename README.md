Provisioning our server stack
===================

Various projects at Label305 use the scripts in this repository to provision development and production environments. For example the `Vagrantfile` in a projects repository root will download their basebox from this repository and execute the base provisioning script `vagrant\bootstrap\bootstrap.sh` from this repo.

The stack
----

* Vagrant / Google Compute Engine
* CentOS
* nginx
* PHP-FPM
* memcache
* MySQL / Google Cloud SQL
* CakePHP
