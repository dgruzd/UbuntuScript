#!/bin/sh

#sudo -u postgres psql postgres
#\password postgres
#sudo -u postgres createdb mydb
#sudo apt-get --assume-yes install postgresql
#sudo apt-get --assume-yes install libpq-dev

sudo add-apt-repository ppa:pitti/postgresql
sudo apt-get update
sudo apt-get --assume-yes install postgresql libpq-dev postgresql-contrib
