#!/bin/sh
#http://wiki.xbmc.org/index.php?title=XBMCbuntu
#alsa
#http://www.webupd8.org/2010/01/upgrade-to-alsa-1022-and-more-in-ubuntu.html
#http://ubuntuforums.org/showpost.php?p=10427675&postcount=1


echo "#### installing xbmc #######"
sudo apt-get --assume-yes install python-software-properties pkg-config && sudo add-apt-repository ppa:team-xbmc/ppa && sudo apt-get update && sudo apt-get --assume-yes install xbmc xorg
echo "#### installing ati drivers ########"
sudo add-apt-repository ppa:ubuntu-x-swat/x-updates && sudo apt-get update && sudo apt-get --assume-yes install fglrx
echo "#### add user xbmc ######"
sudo adduser xbmc --gecos XBMC && sudo usermod --group adm,sudo,cdrom,floppy,audio,video,plugdev,netdev,powerdev,fuse,polkituser xbmc
echo "#### add autostart xbmc ######"
sudo apt-get --assume-yes install xbmc-live
#xinit xbmc-standalone

echo "#### installing alsa #####"
sudo apt-get install alsa-utils pulseaudio
sudo alsamixer
sudo alsactl store 0
