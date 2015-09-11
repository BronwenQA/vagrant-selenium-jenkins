## Description
This project has a Vagrantfile that provisions an ubuntu/trusty64 Vagrant box with PHP, PHPUnit, Jenkins, Git, Selenium, Firefox and Xvfb for testing websites. This project was inspired by Sean Buscay's project, which lacked Git and Jenkins.

## Installation
> git clone https://github.com/BronwenQA/vagrant-selenium-jenkins.git 
> cd vagrant-selenium-jenkins
> vagrant up
> vagrant ssh
If you point the browser on your host to http:localhost:8080 you will be able to configure your Jenkins CI server.
To check that the Selenium driver is running, point your browser to http://localhost:4444/selenium-server/driver/?cmd=getLogMessages

## Tests
TBD

## License
Apache2
