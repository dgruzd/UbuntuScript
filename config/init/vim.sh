#!/bin/sh
config_folder="$HOME/Script/config/vim"

mv -i $HOME/.gvimrc $HOME/.gvimrc.backup
ln -v -s $config_folder/gvimrc $HOME/.gvimrc



mv -i $HOME/.vimrc $HOME/.vimrc.backup
ln -v -s $config_folder/gvimrc $HOME/.vimrc
mv -i $HOME/.vim $HOME/.vim.backup
ln -v -s $config_folder/vimfolder $HOME/.vim

