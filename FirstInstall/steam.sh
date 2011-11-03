#!/bin/sh
sudo apt-get --assume-yes install wine
mkdir -pv /tmp/steam
cd /tmp/steam
wget -N http://cdn.steampowered.com/download/SteamInstall.msi
chmod +x SteamInstall.msi
#wine SteamInstall.msi
echo "please launch SteamInstall.msi"
nautilus /tmp/steam
