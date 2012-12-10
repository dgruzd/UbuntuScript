#!/bin/sh
sudo locale-gen ru_RU.utf8
sudo dpkg-reconfigure locales

sudo apt-get --assume-yes install python-software-properties
sudo add-apt-repository ppa:kakrueger/openstreetmap && sudo apt-get update
sudo apt-get --assume-yes install postgresql-9.1-postgis postgresql-contrib postgresql-server-dev-9.1
sudo apt-get --assume-yes install libapache2-mod-tile
#cd /tmp
#wget http://download.geofabrik.de/openstreetmap/europe/russia-european-part.osm.pbf
#osm2pgsql --slim -C 256 –number-processes 1 russia-european-part.osm.pbf
#sudo touch /var/lib/mod_tile/planet-import-complete && sudo /etc/init.d/renderd restart
