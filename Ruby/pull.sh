#!/bin/sh
dir=$HOME/something-secret
log=$HOME/secret.log
cd $dir 
git pull origin master >> $log
echo "##############" >> $log
tail $log
touch tmp/restart.txt

