#!/bin/sh
#http://realmfpa.ru/?p=250


#https://github.com/nyaa/UbuntuScript/raw/master/dropbox-pump.sh

sudo apt-get --assume-yes install aptitude vim
#sudo vim /etc/apt/sources.list

sudo sed -i 's/# deb/deb/g' /etc/apt/sources.list

sudo apt-get update
sudo apt-get --assume-yes remove network-manager network-manager-gnome
sudo apt-get --assume-yes install xautomation epiphany-browser


echo "auto eth0" | sudo tee -a  /etc/network/interfaces
echo "iface eth0 inet dhcp" | sudo tee -a  /etc/network/interfaces


sudo /etc/init.d/networking restart
cd $HOME/Desktop
wget https://www.dropbox.com/download?dl=packages/nautilus-dropbox_0.6.9_i386.deb && sudo dpkg -i download*
wget http://dl.dropbox.com/u/18466625/script.tar && tar xvf script.tar && cd dbhacking/


#while [ 1 ]; do sh script db.tt/lspEycOe; done
