#!/bin/sh
#echo "deb http://ppa.launchpad.net/michael-astrapi/ppa/ubuntu YOUR_UBUNTU_VERSION_HERE main" | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:michael-astrapi/ppa
sudo apt-get update && sudo apt-get install indicator-virtualbox 


