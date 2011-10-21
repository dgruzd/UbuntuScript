#!/bin/sh
#dist_name=`lsb_release -c | awk -F":" '{ print $2 }'`
#echo "deb http://download.skype.com/linux/repos/debian/ stable non-free" | sudo tee -a /etc/apt/sources.list
#sudo sed -i 's/# deb http:\/\/archive.canonical.com\/ubuntu lucid partner/deb http:\/\/archive.canonical.com\/ubuntu lucid partner/g' /etc/apt/sources.list
#sudo apt-get update && sudo apt-get --assume-yes install skype
cd /tmp
wget -N http://download.skype.com/linux/skype-ubuntu_2.2.0.35-1_amd64.deb
sudo dpkg -i skype-ubuntu*
