#!/bin/sh
#http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get --assume-yes install oracle-java7-installer
#sudo update-java-alternatives -s java-7-oracle
#sudo apt-get install oracle-java7-set-default
