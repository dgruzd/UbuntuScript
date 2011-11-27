#!/bin/sh
USER=`whoami`
sudo apt-get --assume-yes install screen vim
echo "sudo -H -u $USER screen -A -m -d -S rtorrent rtorrent" | sudo tee -a /etc/rc.local
sudo vim /etc/rc.local
