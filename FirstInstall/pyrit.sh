#!/bin/sh

sudo apt-get --assume-yes install python-dev libpcap-dev

mkdir -p /tmp/pyrit
cd /tmp/pyrit

svn checkout http://pyrit.googlecode.com/svn/trunk/ pyrit-read-only
cd pyrit-read-only
cd pyrit
sudo python setup.py install

rm -rf /tmp/pyrit
