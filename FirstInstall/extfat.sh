#!/bin/sh
sudo add-apt-repository ppa:relan/exfat
sudo apt-get update
sudo apt-get --assume-yes install exfat-utils fuse-exfat

#sudo mount.exfat-fuse /dev/sdh1 /mnt/ 
