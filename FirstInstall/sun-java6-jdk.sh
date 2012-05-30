#!/bin/sh


dist_name=oneiric
#sudo add-apt-repository ppa:ferramroberto/java
echo "deb http://ppa.launchpad.net/ferramroberto/java/ubuntu $dist_name main" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/ferramroberto/java/ubuntu $dist_name main" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
sudo apt-get --assume-yes install sun-java6-jdk #sun-java6-plugin
sudo update-alternatives --config java
