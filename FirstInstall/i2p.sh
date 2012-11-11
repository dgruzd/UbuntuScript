#!/bin/sh
sudo apt-add-repository ppa:i2p-maintainers/i2p
sudo apt-get update
sudo apt-get --assume-yes install i2p
sudo dpkg-reconfigure i2p
