#!/bin/sh
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update
sudo apt-get --assume-yes install nginx


CONF="/etc/nginx/nginx.conf"
echo "## Deny access to any host other than (www.)mydomain.com" | sudo tee -a $CONF
echo "#server {" | sudo tee -a $CONF
echo "#  server_name  _;  #default" | sudo tee -a $CONF
echo "#  return 444;" | sudo tee -a $CONF
echo "#}" | sudo tee -a $CONF
