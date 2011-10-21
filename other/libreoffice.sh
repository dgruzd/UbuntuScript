#!/bin/sh
#sudo apt-get purge openoffice*.*
sudo apt-get autoremove openoffice*.*
sudo add-apt-repository ppa:libreoffice/ppa
sudo apt-get update
sudo apt-get --assume-yes install libreoffice libreoffice-gnome libreoffice-l10n-ru
