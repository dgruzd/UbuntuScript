#!/bin/sh

sudo apt-get install python-software-properties pkg-config
sudo add-apt-repository ppa:team-xbmc
#unstable
#sudo add-apt-repository ppa:team-xbmc/unstable
sudo apt-get update
sudo apt-get install xbmc xbmc-standalone
#sudo apt-get --assume-yes install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ugly-multiverse
