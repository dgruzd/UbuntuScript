#!/bin/sh
sudo apt-get --assume-yes install unzip
cd /tmp
wget -N http://dl.dropbox.com/u/9175582/steam.zip
unzip steam.zip
rm steam.zip
