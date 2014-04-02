# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Fix slow DNS lookups with VirtualBox's DNS proxy:
# https://github.com/mitchellh/vagrant/issues/1172#issuecomment-9438465
echo 'options single-request-reopen' >> /etc/resolv.conf

# Adding epel repository
cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
enabled=1
gpgcheck=0
EOM

# Disabeling the Firewall
chkconfig iptables off
chkconfig iptables6 off

# Installing OS packages
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl dkms nfs-utils

# Installing Tool packages
yum -y install wget htop git curl vim

# Adding specific epel repository
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Installing Yum prio
yum install -y yum-priorities

# Installing all required packages for Nginx and PHP
yum install -y nginx php-fpm php-gd php-mysql php-mcrypt php-curl php-pecl-apc php-cli memcached php-pecl-memcache

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
