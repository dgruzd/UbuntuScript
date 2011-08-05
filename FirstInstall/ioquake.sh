#!/bin/sh

cd $HOME/Desktop
wget -N http://ioquake3.org/data/quake3-latest-pk3s.zip

wget -N http://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.x86_64.run
# wget -N http://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.i386.run

LANG=C sudo sh ioquake3-1.36-7.1.x86_64.run

