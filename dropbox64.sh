#!/bin/sh
filename="nautilus-dropbox_0.7.1_amd64.deb"
#filename="nautilus-dropbox_0.6.8_i386.deb"    

cd /tmp
echo "Downloading Dropbox: $filename"
wget -N http://linux.dropbox.com/packages/$filename
sudo dpkg -i $filename
rm $filename
