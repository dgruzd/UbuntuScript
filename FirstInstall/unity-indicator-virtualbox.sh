#!/bin/sh
echo "deb http://ppa.launchpad.net/michael-astrapi/ppa/ubuntu natty main" | sudo tee -a /etc/apt/sources.list
#sudo add-apt-repository ppa:michael-astrapi/ppa
sudo apt-get update && sudo apt-get --assume-yes install indicator-virtualbox 


