#!/bin/sh
config_folder="$HOME/Dropbox/UbuntuScript/config"

mv -i $HOME/.gvimrc $HOME/.gvimrc.backup
ln -s $config_folder/gvimrc $HOME/.gvimrc



mv -i $HOME/.vimrc $HOME/.vimrc.backup
ln -s $config_folder/vimrc $HOME/.vimrc
ln -s $config_folder/vim/vimfolder $HOME/.vim

