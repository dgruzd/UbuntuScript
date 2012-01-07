#!/bin/sh
#echo "deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu natty main" | sudo tee -a /etc/apt/sources.list
sudo apt-add-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get --assume-yes install bitcoin-qt
