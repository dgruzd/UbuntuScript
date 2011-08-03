#!/bin/sh
dist_name=`lsb_release -c | awk -F":" '{ print $2 }'`
sudo echo "deb http://deb.torproject.org/torproject.org $dist_name main" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
sudo apt-get update
sudo apt-get --assume-yes install tor tor-geoipdb
