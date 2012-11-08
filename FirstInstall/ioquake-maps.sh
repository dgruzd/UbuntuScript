#!/bin/sh
cd /tmp
echo "Downloading maps.."
axel -a http://q3.zengile.com/system/q3files/quake3-maps.zip
unzip quake3-maps.zip && rm -v quake3-maps.zip
cd quake3-maps
cp -v *.pk3 $HOME/.q3a/baseq3
rm -rf quake3-maps/
