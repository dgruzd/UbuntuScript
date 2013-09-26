#!/bin/sh
#sudo apt-get -y install linux-image-server
#sudo apt-get -y install xen-utils-4.1 xen-utils-common
#sudo apt-get -y install xen-hypervisor-4.1-amd64
#sudo apt-get -y install xenstore-utils

# https://help.ubuntu.com/community/Xen
sudo apt-get -y install xen-hypervisor-amd64
#Modify GRUB to default to booting Xen ("Xen 4.1-amd64" should be replaced with the appropriate name, in 12.10 the line is "Ubuntu GNU/Linux, with Xen hypervisor"):
sudo sed -i 's/GRUB_DEFAULT=.*\+/GRUB_DEFAULT="Xen 4.1-amd64"/' /etc/default/grub

#Set the default toolstack to xm (aka xend):
sudo sed -i 's/TOOLSTACK=.*\+/TOOLSTACK="xm"/' /etc/default/xen

sudo apt-get install bridge-utils
