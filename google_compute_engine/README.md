Google Compute Engine
=======

Scripts to deploy a CakePHP application to a brand new Google Compute Engine instance. These scripts are made so you only need to add a new box when these scripts are updated, and not with every deployment.

* Adds a user for [Deploy](http://deployhq.com).
* Installs a [Newrelic](http://newrelic.com) deamon for server monitoring.

Getting started
---
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
* **Don't forget to setup [logging](https://github.com/Label305/centos-lemp-cakephp#logging).**
