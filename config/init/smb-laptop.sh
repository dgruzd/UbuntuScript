#!/bin/sh
sudo ln -vi -s $HOME/Script/config/smb-laptop.conf /etc/samba/smb.conf
sudo smbpasswd -a nyaa
sudo smbpasswd -e nyaa
