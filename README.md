## Description
This project has a Vagrantfile that provisions an ubuntu/trusty64 Vagrant box with PHP, PHPUnit, Jenkins, Git, Selenium, Firefox and Xvfb for testing websites. This project was inspired by <a href="https://github.com/seanbuscay/vagrant-phpunit-selenium">Sean Buscay's project</a>. Some of the improvements are:
* Built on Ubuntu 14.04 (trusty) 64 bit instead of the 32 bit distro of Ubuntu 12.04
* Includes Jenkins, Git and the Git plugin for Jenkins
* Can be started just with <tt>vagrant up</tt> instead of <tt>vagrant up --provision</tt>

## Installation
* `git clone https://github.com/BronwenQA/vagrant-selenium-jenkins.git`
* `cd vagrant-selenium-jenkins`
* `vagrant up`

If you point the browser on your host to http:localhost:8080 you will be able to configure your Jenkins CI server.
To check that the Selenium driver is running, point your browser to http://localhost:4444/selenium-server/driver/?cmd=getLogMessages

## Tests
To test that everything is working, you can run the test in ExampleTest.php.
* `vagrant ssh`
* `phpunit --log-junit report.xml /vagrant/ExampleTest.php`

If your box is correctly provisioned, you should see:
`OK (1 test, 1 assertion)`

## License
Apache2
