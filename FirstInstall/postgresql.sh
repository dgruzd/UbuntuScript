#!/bin/sh
dist_name=`lsb_release -c | awk -F":" '{ print $2 }'| sed -e 's/^[ \t]*//'`

sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ $dist_name-pgdg main" >> /etc/apt/sources.list.d/pgdg.list


wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install libpq-dev postgresql-9.3


#sudo -u postgres createuser --superuser `whoami`
#echo "create database `whoami` owner `whoami`" | sudo -u postgres psql
