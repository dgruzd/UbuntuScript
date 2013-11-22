#!/bin/sh

sudo apt-get -y install avahi-daemon avahi-utils
cd /tmp
wget http://downloads.plexapp.com/plex-media-server/0.9.8.10.215-020456b/plexmediaserver_0.9.8.10.215-020456b_amd64.deb
sudo dpkg -i plexmediaserver_0.9.8.10.215-020456b_amd64.deb
#sudo apt-get -f install
