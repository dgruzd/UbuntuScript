#!/bin/sh

# http://www.modrails.com/install.html
# http://www.modrails.com/documentation/Users%20guide%20Apache.html

# sudo apt-get --assume-yes remove apache2 libcurl4-openssl-dev apache2-dev && sudo apt-get autoremove

sudo mkdir -pv /var/www/rails
sudo apt-get --assume-yes install apache2
gem install passenger
#Curl development headers with SSL support
sudo apt-get --assume-yes install libcurl4-openssl-dev
#Apache 2 development headers
sudo apt-get --assume-yes install apache2-dev

passenger-install-apache2-module

#add three line to this file
sudo gedit /etc/apache2/apache2.conf
#add sites to this file
sudo gedit /etc/apache2/sites-enabled/000-default

sudo /etc/init.d/apache2 reload


#cd /var/www/
#sudo git clone git@github.com:IvanShamatov/something-secret.git
#cd /var/www/something-secret/
#sudo chown nyaa:nyaa /var/www/something-secret/
#sudo chown -R nyaa:nyaa /var/www/something-secret/
#passenger start
