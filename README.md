Vagrant CentOS 6.5+ Boxes
==============

Go to [releases](https://github.com/label305/vagrant-centos/releases) to explore all the different boxes.

These boxes are used to create development environments at Label305.

Don't forget to add the following line to your Vagrantfile: `config.vm.synced_folder "./", "/vagrant", :owner=> 'vagrant', :group=>'www', :mount_options => ['dmode=775', 'fmode=775']`.