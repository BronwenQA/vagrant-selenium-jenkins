#!/usr/bin/env bash

echo "Installing PHP..."
apt-get update >/dev/null 2>&1
#apt-get install -y apache2 >/dev/null 2>&1
apt-get install -y php5 >/dev/null 2>&1
apt-get install -y php5-cli >/dev/null 2>&1
apt-get install -y php5-curl >/dev/null 2>&1

echo "Installing PHPUnit..."
# We need the "old" phpunit since Ubuntu 14.04 supports PHP 5.5
# and the "new" phpunit needs PHP 5.6
wget https://phar.phpunit.de/phpunit-old.phar >/dev/null 2>&1
chmod +x phpunit-old.phar >/dev/null 2>&1
mv phpunit-old.phar /usr/local/bin/phpunit 

# Using instructions from http://pietervogelaar.nl/ubuntu-14-04-install-selenium-as-service-headless
echo "Installing Firefox and xvfb"
apt-get install -y firefox xvfb 

echo "Downloading Selenium..."
wget http://selenium-release.storage.googleapis.com/2.47/selenium-server-standalone-2.47.1.jar >/dev/null 2>&1
mv selenium-server-standalone-2.47.1.jar /usr/local/bin/selenium-server-standalone.jar

echo "Installing git..."
apt-get install -y git >/dev/null 2>&1

echo "Installing LinkChecker"
apt-get install -y LinkChecker >/dev/null 2>&1

echo "Installing Jenkins..."
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update >/dev/null 2>&1
apt-get install -y jenkins >/dev/null 2>&1

echo "Installing Jenkins plugins..."
wget http://updates.jenkins-ci.org/latest/scm-api.hpi >/dev/null 2>&1
wget http://updates.jenkins-ci.org/latest/git-client.hpi >/dev/null 2>&1
wget http://updates.jenkins-ci.org/latest/git.hpi >/dev/null 2>&1

echo "Starting Xvfb..."
export DISPLAY=:10
Xvfb :10 -screen 0 1024x768x8 -ac &

echo "Starting Firefox..."
firefox &

echo "Starting Selenium..."
nohup java -jar  /usr/local/bin/selenium-server-standalone.jar &

echo "Starting Jenkins..."
/etc/init.d/jenkins start
# Wait 1 minute for Jenkins to start
sleep 60
echo "Moving Jenkins plugins..."
chown jenkins:jenkins *.hpi
mv *.hpi /var/cache/jenkins/war/WEB-INF/plugins
/etc/init.d/jenkins restart

# Overwrite rc.local so that we start Selenium, etc. on boot
cp /vagrant/rc.local /etc/rc.local
chown root:root /etc/rc.local

