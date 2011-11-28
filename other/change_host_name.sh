#!/bin/sh
sudo vim /etc/hosts
sudo vim /etc/hostname
sudo /etc/init.d/hostname.sh stop
sudo /etc/init.d/hostname.sh start
sudo /etc/init.d/networking restart
