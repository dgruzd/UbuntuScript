#!/bin/sh
#http://blog.asiantuntijakaveri.fi/2012/12/setting-up-xbmcbuntu-12-based-htpc-part_8278.html
#http://wiki.xbmc.org/index.php?title=How-to:Setup_PS3_BD_Remote

sudo apt-get purge bluez
sudo add-apt-repository ppa:kitlaan/ppa
sudo apt-get update
sudo apt-get install bluez
