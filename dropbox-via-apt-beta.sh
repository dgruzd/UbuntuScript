#!/bin/sh

dist_name=`lsb_release -c | awk -F":" '{ print $2 }'`

echo "deb http://linux.dropbox.com/ubuntu $dist_name main" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
sudo apt-get --assume-yes install nautilus-dropbox
