#!/bin/sh
#echo "" | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:lorenzo-carbonell/atareao
sudo apt-get update && sudo apt-get install touchpad-indicator

