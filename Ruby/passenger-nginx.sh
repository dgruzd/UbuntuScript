#!/bin/sh
#http://www.modrails.com/documentation/Users%20guide%20Nginx.html

sudo add-apt-repository ppa:nginx/stable
sudo apt-get update
sudo apt-get install nginx


passenger-config --root


#Curl development headers with SSL support
#sudo apt-get --assume-yes install libcurl4-openssl-dev
#rvmsudo passenger-install-nginx-module
#sudo gedit /opt/nginx/conf/nginx.conf

