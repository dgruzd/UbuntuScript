#!/bin/sh
sudo apt-get install samba
sudo cp -v $HOME/Script/config/smb-laptop.conf /etc/samba/smb.conf
sudo smbpasswd -a nyaa
sudo smbpasswd -e nyaa
