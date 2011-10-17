#!/bin/sh
cd /usr/share/backgrounds
sudo wget -N http://dl.dropbox.com/u/9513848/199340-1920x1200.jpg
echo "background=/usr/share/backgrounds/199340-1920x1200.jpg" | sudo tee -a /etc/lightdm/unity-greeter.conf
sudo grep -n "background" /etc/lightdm/unity-greeter.conf | less
sudo gedit /etc/lightdm/unity-greeter.conf


