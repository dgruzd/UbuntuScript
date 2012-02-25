#!/bin/sh
sudo add-apt-repository ppa:relan/exfat
sudo apt-get update
sudo apt-get install exfat-utils fuse-exfat
echo "USAGE: sudo mount.exfat-fuse /dev/sdh1 /mnt/"
