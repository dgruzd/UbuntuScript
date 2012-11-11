#!/bin/sh

sudo apt-get --assume-yes install tinyproxy

export user=$(whoami)



sudo sed -i "s/nobody/$user/g" /etc/tinyproxy.conf
sudo sed -i "s/nogroup/$user/g" /etc/tinyproxy.conf
sudo vim /etc/tinyproxy.conf


sudo chown $user:$user /var/log/tinyproxy/tinyproxy.log
sudo chown $user:$user /var/run/tinyproxy/tinyproxy.pid
