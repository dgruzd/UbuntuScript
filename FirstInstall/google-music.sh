#!/bin/sh
filename="google-musicmanager-beta_current_amd64.deb"
#http://dl.google.com/linux/direct/google-musicmanager-beta_current_amd64.deb
#http://dl.google.com/linux/direct/google-musicmanager-beta_current_i386.deb
cd /tmp
echo "Downloading: $filename"
wget -N http://dl.google.com/linux/direct/$filename
sudo dpkg -i $filename
rm $filename
sudo apt-get -f install
