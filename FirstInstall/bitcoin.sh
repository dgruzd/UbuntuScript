#!/bin/sh
echo "deb http://ppa.launchpad.net/stretch/bitcoin/ubuntu natty main" | sudo tee -a /etc/apt/sources.list
#sudo apt-add-repository ppa:stretch/bitcoin
sudo apt-get update
sudo apt-get --assume-yes install bitcoin
