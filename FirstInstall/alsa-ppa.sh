#!/bin/sh
sudo apt-get install aptitude
sudo aptitude update && sudo aptitude safe-upgrade
sudo add-apt-repository ppa:team-iquik/alsa
sudo add-apt-repository ppa:ubuntu-audio-dev/ppa
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install alsa-base alsa-utils linux-alsa-driver-modules-$(uname -r) --force-yes
