#!/usr/bin/env bash

echo "Installing PHP..."
apt-get update >/dev/null 2>&1
#apt-get install -y apache2 >/dev/null 2>&1
apt-get install -y php5 >/dev/null 2>&1
apt-get install -y php5-cli >/dev/null 2>&1

echo "Installing PHPUnit..."
wget https://phar.phpunit.de/phpunit.phar >/dev/null 2>&1
chmod +x phpunit.phar >/dev/null 2>&1
mv phpunit.phar /usr/local/bin/phpunit 

echo "Installing Jenkins..."
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' >/dev/null 2>&1
apt-get update >/dev/null 2>&1
apt-get install -y jenkins >/dev/null 2>&1
#rm -rf /var/www
#ln -fs /vagrant /var/www
