#!/bin/sh
dist_name=`lsb_release -c | awk -F":" '{ print $2 }'`
sudo echo "deb http://deb.torproject.org/torproject.org $dist_name main" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
sudo apt-get update
sudo apt-get --assume-yes install tor tor-geoipdb polipo

POLIPO_CONF="/etc/polipo/config"
echo "proxyPort = 8118" | sudo tee -a $POLIPO_CONF
echo "socksParentProxy = \"localhost:9050\"" | sudo tee -a $POLIPO_CONF
echo "socksProxyType = socks5" | sudo tee -a $POLIPO_CONF
echo "proxyAddress = \"0.0.0.0\"" | sudo tee -a $POLIPO_CONF
echo "allowedClients = 127.0.0.1 #, 192.168.1.0/24" | sudo tee -a $POLIPO_CONF
sudo service polipo restart
