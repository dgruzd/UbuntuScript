#!/bin/sh
sudo apt-get --assume-yes install build-essential wget

cd /tmp
wget -N http://3proxy.ru/0.6.1/3proxy-0.6.1.tgz
tar xvzf 3proxy-0.6.1.tgz
cd 3proxy-0.6.1
make -f Makefile.Linux
sudo cp -v src/socks /usr/bin/3proxy-socks

cd /tmp 
rm -rf 3proxy-0.6.1 3proxy-0.6.1.tgz
