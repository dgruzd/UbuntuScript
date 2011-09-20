#!/bin/sh
#LOCALES PROBLEM
sudo locale-gen en_US ru_RU.UTF-8
sudo dpkg-reconfigure locales


#LAMP
sudo apt-get install apache2 php5 php5-mysql mysql-server mysql-client phpmyadmin
