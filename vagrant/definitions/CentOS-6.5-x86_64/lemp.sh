# Executed after cleanup
# Installs packages for faster vagrant provision

# Adding specific epel repository
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Installing Yum prio
yum install -y yum-priorities

# Installing Tool packages
yum -y install htop git curl vim

# Installing all required packages for Nginx and PHP
yum install -y nginx php-fpm php-gd php-mysql php-mcrypt php-curl php-pecl-apc php-cli memcached php-pecl-memcache

# Adding www user to enable first-mount with specific persmissions
useradd www -M # setup user

echo "LEMP installation done, www user added"