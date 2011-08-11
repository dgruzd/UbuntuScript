#!/bin/sh
cd /tmp
wget -N http://dl.dropbox.com/u/9175582/HelloWorld.zip
unzip HelloWorld.zip
cd HelloWorld
rm -v HelloWorld.zip
bundle install
