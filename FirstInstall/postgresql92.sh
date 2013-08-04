#!/bin/sh
sudo add-apt-repository ppa:pitti/postgresql
sudo apt-get update
sudo apt-get install postgresql-9.2 postgresql-server-dev-9.2 postgresql-contrib-9.2
 
sudo su -l postgres
psql -d template1 -p 5433
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

service postgresql stop

/usr/lib/postgresql/9.2/bin/pg_upgrade -b /usr/lib/postgresql/9.1/bin -B /usr/lib/postgresql/9.2/bin -d /var/lib/postgresql/9.1/main/ -D /var/lib/postgresql/9.2/main/ -O "-c config_file=/etc/postgresql/9.2/main/postgresql.conf" -o "-c config_file=/etc/postgresql/9.1/main/postgresql.conf"
 
logout # logout postgresql back to previous user
 
sudo apt-get remove postgresql-9.1
sudo vim /etc/postgresql/9.2/main/postgresql.conf # change port to 5432
sudo service postgresql restart
