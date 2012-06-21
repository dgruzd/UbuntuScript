#!/bin/sh

sudo apt-get install nginx
sudo apt-get install php5-fpm php5-dev php5-mysql php5-curl php5-gd php5-mcrypt php5-sqlite php5-xmlrpc php5-xsl php5-common

sudo /etc/init.d/php5-fpm restart
