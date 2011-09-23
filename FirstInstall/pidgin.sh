#!/bin/sh
#deb http://ppa.launchpad.net/pidgin-developers/ppa/ubuntu YOUR_UBUNTU_VERSION_HERE main
sudo add-apt-repository ppa:pidgin-developers/ppa
sudo apt-get update
sudo apt-get --assume-yes install pidgin
