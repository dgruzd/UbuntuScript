#!/bin/sh
sudo add-apt-repository ppa:team-iquik/alsa
sudo add-apt-repository ppa:ubuntu-audio-dev/ppa
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install linux-alsa-driver-modules-$(uname -r) --force-yes
