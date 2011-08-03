#!/bin/sh
mv -iv $HOME/TIME_TO_MOVE/ $HOME/TIME_TO_MOVE-old
mkdir -pv $HOME/TIME_TO_MOVE

echo "################### Chromium browser	###################"
cp -r $HOME/.config/chromium/ $HOME/TIME_TO_MOVE

echo "################### Firefox browser	###################"
cp -r $HOME/.mozilla/firefox/ $HOME/TIME_TO_MOVE

echo "################### Bitcoin		###################"
cp -r $HOME/.bitcoin/ $HOME/TIME_TO_MOVE

echo "################### Pidgin		###################"
cp -r $HOME/.purple/ $HOME/TIME_TO_MOVE

echo "################### Cairo Dock		###################"
cp -r $HOME/.config/cairo-dock/ $HOME/TIME_TO_MOVE

echo "################### Dropbox		###################"
cp -r $HOME/Dropbox/ $HOME/TIME_TO_MOVE

echo "################### Desktop		###################"
cp -r $HOME/Desktop/ $HOME/TIME_TO_MOVE

echo "################### Virtualbox		###################"
cp -r $HOME/VirtualBox\ VMs/ $HOME/TIME_TO_MOVE
cp -r $HOME/.VirtualBox/ $HOME/TIME_TO_MOVE


