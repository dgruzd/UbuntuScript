#!/bin/sh

# http://www.modrails.com/install.html
# http://www.modrails.com/documentation/Users%20guide%20Apache.html


gem install passenger
sudo aptitude install libcurl4-openssl-dev
sudo aptitude install apache2-dev
passenger-install-apache2-module
sudo vim /etc/apache2/apache2.conf
sudo vim /etc/apache2/sites-enabled/000-default
sudo /etc/init.d/apache2 reload
cd /var/www/
sudo git clone git@github.com:IvanShamatov/something-secret.git
cd /var/www/something-secret/
sudo chown nyaa:nyaa /var/www/something-secret/
sudo chown -R nyaa:nyaa /var/www/something-secret/
passenger start
