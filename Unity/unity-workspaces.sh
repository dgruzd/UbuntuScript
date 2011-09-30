#!/bin/sh
#echo "deb http://ppa.launchpad.net/geod/ppa-geod/ubuntu YOUR_UBUNTU_VERSION_HERE main" | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:geod/ppa-geod
sudo apt-get update
sudo apt-get --assume-yes install indicator-workspaces

