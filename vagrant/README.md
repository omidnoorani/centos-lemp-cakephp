Vagrant CentOS 6.5 Boxes
==============

Go to [releases](https://github.com/label305/centos-lemp-cakephp/releases) to explore all the different boxes.

These boxes are used to create development environments at Label305.

You can use the `Vagrantfile` and `bootstrap-example.sh` example for your own project.

Create a new Box
--------------

Boxes were created using Veewee and the definition files.

```sh
$ gem install veewee
$ veewee vbox build CentOS-6.5-x86_64
# Eject the disks from the running VM and shutdown.
$ vagrant package --base CentOS-6.5-x86_64 --output CentOS-6.5-x86_64-v20140311.box
```