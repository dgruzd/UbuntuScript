#!/bin/sh
echo "deb http://dl.google.com/linux/deb/ stable non-free main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get --assume-yes --force-yes install google-chrome-stable
#filename="google-chrome-stable_current_amd64.deb"
#cd /tmp
#sudo apt-get --assume-yes install libcurl3 libnspr4-0d libnss3-1d
#echo "Downloading: $filename"
#wget -N https://dl.google.com/linux/direct/$filename
#without this chrome is not installing
#sudo apt-get --assume-yes install libcurl3 libnspr4-0d libnss3-1d
#sudo dpkg -i $filename
#rm $filename

