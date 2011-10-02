#!/bin/sh
#echo "deb http://ppa.launchpad.net/caffeine-developers/ppa/ubuntu YOUR_UBUNTU_VERSION_HERE main" | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:caffeine-developers/ppa
sudo apt-get update && sudo apt-get --assume-yes install caffeine
