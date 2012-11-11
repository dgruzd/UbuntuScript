#!/bin/sh
sudo apt-get --assume-yes install linux-source linux-headers-generic
sudo apt-add-repository ppa:ubuntu-x-swat/x-updates
sudo apt-get update
sudo apt-get install nvidia-current
