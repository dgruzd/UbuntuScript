#!/bin/sh
echo "deb http://repo.ajenti.org/debian main main" | sudo tee -a /etc/apt/sources.list
wget http://repo.ajenti.org/debian/key -O- | apt-key add -
sudo apt-get update && sudo apt-get --assume-yes --force-yes install ajenti
