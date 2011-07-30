#!/bin/sh
filename="wuala_current_amd64.deb"
cd /tmp
sudo apt-get install default-jre java5-runtime
echo "Downloading: $filename"
wget -N http://cdn.wuala.com/repo/deb/$filename
sudo dpkg -i $filename
rm $filename

