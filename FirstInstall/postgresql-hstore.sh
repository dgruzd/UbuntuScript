#!/bin/sh
sudo apt-get --assume-yes install postgresql-contrib
echo "CREATE EXTENSION IF NOT EXISTS hstore;" | sudo -u postgres psql
