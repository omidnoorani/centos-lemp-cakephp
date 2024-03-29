Provisioning our server stack
===================

Various projects at Label305 use the scripts from this repository to provision development and production environments. This ensures maximum compatibility.

The scripts execute provider-specific scripts form [`vagrant/bootstrap`](vagrant/bootstrap) and [`google_compute_engine/bootstrap`](google_compute_engine/bootstrap) as well as generic scripts from [`bootstrap`](bootstrap).

Getting started
----
#### Vagrant

You should have [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/) installed.

Use the template [Vagrantfile](vagrant/Vagrantfile) and place it in your projects repository root and execute `vagrant up`. This should download a [basebox](https://github.com/Label305/centos-lemp-cakephp/releases) from this repository and execute the [base provisioning script](vagrant/bootstrap/bootstrap.sh) from this repository.

If you whish to add your own provisioning script make sure the following line is executed in the `Vagrantfile` or in your custom provisioning script before anything else.

```sh
$ curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/vagrant/bootstrap/bootstrap.sh | bash
```

#### Google Compute Engine

Launch a provisioned instance using gcutil and the `launch_with_gcutil.sh` script.

* You need to have a [Deploy](http://deployhq.com) project and its ssh-key.
* You need to set the metatags `deploy-hq-key`, `newrelic-license` in your projects metatag settings before starting a box.
* You need to have setup logging in your application with syslog.
* You need to have gcutil installed and authenticated.
* Keep the [naming conventions](http://intranet.label305.com/technology/google-cloud.html) in mind.

Launch server with:
```sh
# cd into the root of this repository
$ bash google_compute_engine/launch-with-gcutil.sh {your project name} {instance name}
```

* After this you should assign the correct IP-address in the [Google Developer Console](https://console.developers.google.com/project).
* You should add the server to the [Deploy](http://deployhq.com) project.
* Make the needed adjustments to your config files.
* Setup the execution of provisioning scripts on the server.
* And deploy the application using [Deploy](http://deployhq.com).

The stack
----

* [Vagrant](vagrant) (Development) / [Google Compute Engine](google_compute_engine) (Production)
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

License
----

Copyright 2014 Label305 B.V.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
