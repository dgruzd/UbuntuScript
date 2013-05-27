#!/bin/bash

cd /tmp

URL=https://github.com/nyaa/UbuntuScript/raw/master/other/btsync
wget32="btsync_i386.tar.gz"
wget64="btsync_x64.tar.gz"
config=$HOME/.btsync.rc

if [ $(uname -m) == 'x86_64' ]; then
  filename=$wget64
  wget -N $URL/$wget64
else
  filename=$wget32
  wget -N $URL/$wget32
fi

mkdir -pv btsync
tar xvzf $filename -C btsync
sudo mv btsync/btsync /usr/bin/
rm -rf btsync


btsync --dump-sample-config > $config
mkdir -pv $HOME/.sync

sed -i "s/home\/user/home\/$(whoami)/" $config
sed -i "s/My\sSync\sDevice/$(cat /etc/hostname)/" $config

"${EDITOR:-vi}" $config



echo "#sudo -u $(whoami) -H btsync --config $config" | sudo tee -a /etc/rc.local
sudo "${EDITOR:-vi}" /etc/rc.local
