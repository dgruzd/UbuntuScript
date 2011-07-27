#!/bin/sh
filename="google-chrome-stable_current_amd64.deb"
cd /tmp
sudo aptitude install libcurl3 libnspr4-0d libnss3-1d
echo "Downloading: $filename"
wget -N https://dl.google.com/linux/direct/$filename
#without this chrome is not installing
sudo aptitude install libcurl3 libnspr4-0d libnss3-1d
sudo dpkg -i $filename
rm $filename
