#!/bin/sh
echo "deb http://download.virtualbox.org/virtualbox/debian natty contrib" | sudo tee -a /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo aptitude update
sudo aptitude install virtualbox-4.1
