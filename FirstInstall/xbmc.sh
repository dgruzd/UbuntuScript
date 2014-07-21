#!/bin/sh

#http://wiki.xbmc.org/index.php?title=HOW-TO_set_up_HDMI_audio_on_nVidia_GeForce_G210,_GT220,_or_GT240
#plughw:X,7
# SCREEN artefacts fix is Sync to vblanc in compizconfig options and maybe new drivers YEEES & enable vertical sync in it :)
sudo apt-get -y install python-software-properties pkg-config
sudo add-apt-repository ppa:team-xbmc
#echo "deb http://ppa.launchpad.net/team-xbmc/ppa/ubuntu lucid main" | sudo tee -a /etc/apt/sources.list
#unstable
#sudo add-apt-repository ppa:team-xbmc/unstable
sudo apt-get update
sudo apt-get --assume-yes install xbmc xbmc-standalone
#sudo apt-get --assume-yes install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ugly-multiverse
