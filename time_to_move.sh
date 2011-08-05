#!/bin/sh
backup_dir="/home/nyaa/TIME_TO_MOVE_`date \+\%Y_\%m_\%d`"

mv -iv $backup_dir $backup_dir-old
mkdir -pv $backup_dir
echo $backup_dir

echo "################### Chromium browser	###################"
cp -r $HOME/.config/chromium/ $backup_dir

echo "################### Firefox browser	###################"
cp -r $HOME/.mozilla/firefox/ $backup_dir

echo "################### Bitcoin		###################"
cp -r $HOME/.bitcoin/ $backup_dir

echo "################### Google Music		###################"
cp -r $HOME/.config/google-musicmanager/ $backup_dir

echo "################### Pidgin		###################"
cp -r $HOME/.purple/ $backup_dir

echo "################### Transmission		###################"
cp -r $HOME/.config/transmission/ $backup_dir

echo "################### Cairo Dock		###################"
cp -r $HOME/.config/cairo-dock/ $backup_dir

echo "################### SSH			###################"
cp -r $HOME/.ssh/ $backup_dir

echo "################### Dropbox		###################"
cp -r $HOME/Dropbox/ $backup_dir

echo "################### Desktop		###################"
cp -r $HOME/Desktop/ $backup_dir

echo "################### Virtualbox		###################"
cp -r $HOME/VirtualBox\ VMs/ $backup_dir
cp -r $HOME/.VirtualBox/ $backup_dir


