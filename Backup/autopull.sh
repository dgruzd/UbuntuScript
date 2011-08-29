#!/bin/sh
log_file = "$HOME/autopull.txt"
directory = "/var/www/something-secret/"



cd $directory
git pull origin master >> $log_file 
echo "#########################" >> $log_file
