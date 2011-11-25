#!/bin/sh

#http://habrahabr.ru/blogs/linux/45912/
#http://dobroserver.ru/rsnapshot-inkrementalnoe-rezervnoe-kopirovanie-v-linux

sudo apt-get --assume-yes install rsnapshot

#sudoedit /etc/rsnapshot.conf
sudo sed -i "s/#cmd_ssh/cmd_ssh/g" /etc/rsnapshot.conf
sudo sed -i 's/\/var\/run\/rsnapshot.pid/\/home\/nyaa\/.rsnapshot.pid/g' /etc/rsnapshot.conf
