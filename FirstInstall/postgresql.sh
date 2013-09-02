#!/bin/sh

#sudo -u postgres psql postgres
#\password postgres
#sudo -u postgres createdb mydb
#sudo apt-get --assume-yes install postgresql
#sudo apt-get --assume-yes install libpq-dev

sudo add-apt-repository ppa:pitti/postgresql
sudo apt-get update
#sudo apt-get --assume-yes install postgresql libpq-dev postgresql-contrib
sudo apt-get -y install postgresql-9.2 postgresql-server-dev-9.2 postgresql-contrib-9.2


#sudo -u postgres createuser --superuser `whoami`
#echo "create database `whoami` owner `whoami`" | sudo -u postgres psql
