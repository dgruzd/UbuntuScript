#!/bin/sh
#echo "deb http://download.virtualbox.org/virtualbox/debian natty contrib" | sudo tee -a /etc/apt/sources.list
dist_name=`lsb_release -c | awk -F":" '{ print $2 }'`
echo "deb http://download.virtualbox.org/virtualbox/debian $dist_name contrib" | sudo tee -a /etc/apt/sources.list


wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get --assume-yes install virtualbox-4.1
sudo groupadd vboxusers
export user=$(whoami)
sudo usermod -G vboxusers -a $user
