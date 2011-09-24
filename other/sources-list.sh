#!/bin/sh
url=$1
last=$2
dist_name=natty
#dist_name=`lsb_release -c | awk -F":" '{ print $2 }'`

echo "deb $url $dist_name $last" | sudo tee -a /etc/apt/sources.list
