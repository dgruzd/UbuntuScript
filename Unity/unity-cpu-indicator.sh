#!/bin/sh
#echo "deb http://ppa.launchpad.net/artfwo/ppa/ubuntu YOUR_UBUNTU_VERSION_HERE main" | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:artfwo/ppa
sudo apt-get update && sudo apt-get install indicator-cpufreq
