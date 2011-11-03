#!/bin/sh
sudo apt-get --assume-yes install wine
cd /tmp
wget -N http://cdn.steampowered.com/download/SteamInstall.msi
#chmod +x SteamInstall.msi
wine SteamInstall.msi
