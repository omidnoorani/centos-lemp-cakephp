Provisioning our server stack
===================

Various projects at Label305 use the scripts in this repository to provision development and production environments to ensure maximal compatibility.

[Vagrant](vagrant)
----

For example the [Vagrantfile](vagrant/Vagrantfile) in a projects repository root should download their [basebox](https://github.com/Label305/centos-lemp-cakephp/releases) from this repository and execute the [base provisioning script](vagrant/bootstrap/bootstrap.sh) from this repo by downloading it through curl.

```sh
$ curl -s https://raw.github.com/Label305/centos-lemp-cakephp/master/vagrant/bootstrap/bootstrap.sh | bash
```

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
