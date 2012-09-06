#!/bin/sh
sudo apt-get --assume-yes install postgresql-contrib
#echo "CREATE EXTENSION IF NOT EXISTS hstore;" | sudo -u postgres psql

#USER='nyaa'
#echo "ALTER USER $USER SUPERUSER;" | sudo -u postgres psql
#echo "create extension IF NOT EXISTS hstore;" | psql -U $USER
#echo "ALTER USER $USER NOSUPERUSER;" | sudo -u postgres psql

USER='eventage';DB='eventage_production';echo "ALTER USER $USER SUPERUSER;" | sudo -u postgres psql $DB;echo "create extension IF NOT EXISTS hstore;" | psql -U $USER;echo "ALTER USER $USER NOSUPERUSER;" | sudo -u postgres psql
