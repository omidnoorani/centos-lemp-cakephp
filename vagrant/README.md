Vagrant
==============

You can use the [`Vagrantfile`](Vagrantfile) and [`bootstrap-example.sh`](bootstrap-example.sh) as templates for your own project.

Getting started
----

You should have [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/) installed.

Use the template [Vagrantfile](Vagrantfile) and place it in your projects repository root and execute `vagrant up`. This should download a [basebox](https://github.com/Label305/centos-lemp-cakephp/releases) from this repository and execute the [base provisioning script](bootstrap/bootstrap.sh) from this repository.

Custom script
----

If you wish to add your own provisioning script make sure the following line is executed in the `Vagrantfile` or in your custom provisioning script before anything else.

```sh
$ curl -s https://raw.githubusercontent.com/Label305/centos-lemp-cakephp/master/vagrant/bootstrap/bootstrap.sh | bash
```

Take a look at [`bootstrap-example.sh`](bootstrap-example.sh).

Create a new Box
--------------

Boxes were created using [Veewee](https://github.com/jedi4ever/veewee) and the definition files.

```sh
$ gem install veewee
$ veewee vbox build CentOS-6.5-x86_64
# Eject the disks from the running VM and shutdown.
$ vagrant package --base CentOS-6.5-x86_64 --output CentOS-6.5-x86_64-v20140311.box
```

Creating a new box reference
-----------

http://thornelabs.net/2013/11/11/create-a-centos-65-vagrant-base-box-from-scratch-using-virtualbox.html
https://github.com/NREL/vagrant-boxes

