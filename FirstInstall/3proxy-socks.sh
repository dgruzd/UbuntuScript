#!/bin/sh
sudo apt-get --assume-yes install build-essential wget

cd /tmp
wget -N http://3proxy.ru/0.6.1/3proxy-0.6.1.tgz
tar xvzf 3proxy-0.6.1.tgz
cd 3proxy-0.6.1
make -f Makefile.Linux


sudo mkdir -pv /opt/3proxy
sudo cp -v src/socks /opt/3proxy 
sudo cp -v src/3proxy /opt/3proxy 

echo "daemon" >> config.cfg
echo "users login:CL:password" >> config.cfg
echo "log /dev/null" >> config.cfg
echo "auth strong" >> config.cfg
echo "socks -p5190" >> config.cfg
sudo mv config.cfg /opt/3proxy

sudo vim /opt/3proxy/config.cfg
echo "launching 3proxy"
cd /opt/3proxy/
./3proxy config.cfg

cd /tmp 
rm -rf 3proxy-0.6.1 3proxy-0.6.1.tgz
