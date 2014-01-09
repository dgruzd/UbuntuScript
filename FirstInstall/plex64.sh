#!/bin/sh

sudo apt-get -y install avahi-daemon avahi-utils
cd /tmp
wget -O plex64.deb http://downloads.plexapp.com/plex-media-server/0.9.8.18.290-11b7fdd/plexmediaserver_0.9.8.18.290-11b7fdd_amd64.deb
sudo dpkg -i plex64.deb
#sudo apt-get -f install
