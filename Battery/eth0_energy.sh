#!/bin/sh
#http://www.lesswatts.org/tips/ethernet.php

sudo apt-get --assume-yes install ethtool
#sudo ethtool eth0 | grep "Wake-on"
echo "disabling wake on lan feature"
sudo ethtool -s eth0 wol d
echo "lower the eth0 speed to 100mbit"
sudo ethtool -s eth0 autoneg off speed 100
#undo is:
#ethtool -s eth0 autoneg on speed 1000


