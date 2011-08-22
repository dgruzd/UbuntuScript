#!/bin/sh
dist_name=`lsb_release -c | awk -F":" '{ print $2 }'`
#echo "deb http://download.skype.com/linux/repos/debian/ stable non-free" | sudo tee -a /etc/apt/sources.list
#sudo sed -i 's/# deb http:\/\/archive.canonical.com\/ubuntu lucid partner/deb http:\/\/archive.canonical.com\/ubuntu lucid partner/g' /etc/apt/sources.list
sudo apt-get update && sudo apt-get --assume-yes install skype
