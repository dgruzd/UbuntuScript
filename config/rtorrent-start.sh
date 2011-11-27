#!/bin/sh
sudo apt-get --assume-yes install screen vim
echo "screen -A -m -d -S rtorrent rtorrent" | sudo tee -a /etc/rc.local
sudo vim /etc/rc.local
