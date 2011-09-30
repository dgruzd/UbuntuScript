#!/bin/sh
#echo "deb http://ppa.launchpad.net/indicator-multiload/stable-daily/ubuntu YOUR_UBUNTU_VERSION_HERE main" | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:indicator-multiload/stable-daily
sudo apt-get update && sudo apt-get --assume-yes install indicator-multiload
