#!/bin/sh
#LOCALES PROBLEM
sudo locale-gen en_US ru_RU.UTF-8 && sudo dpkg-reconfigure locales
#sudo export LANG=ru_RU.UTF-8
