#!/bin/sh
#http://realmfpa.ru/?p=250


sudo apt-get install aptitude vim
sudo vim /etc/apt/sources.list
sudo apt-get update && sudo apt-get remove network-manager network-manager-gnome && sudo apt-get install xautomation epiphany-browser


echo "auto eth0" | sudo tee -a  /etc/network/interfaces
echo "iface eth0 inet dhcp" | sudo tee -a  /etc/network/interfaces


sudo /etc/init.d/networking restart
wget https://www.dropbox.com/download?dl=packages/nautilus-dropbox_0.6.9_i386.deb && sudo dpkg -i download*
wget http://dl.dropbox.com/u/18466625/script.tar && tar xvf script.tar && cd dbhacking/

