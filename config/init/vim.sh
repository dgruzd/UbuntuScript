#!/bin/sh
config_folder="$HOME/Script/config/vim"

mv -i $HOME/.gvimrc $HOME/.gvimrc.backup
ln -s $config_folder/gvimrc $HOME/.gvimrc



mv -i $HOME/.vimrc $HOME/.vimrc.backup
ln -s $config_folder/vimrc $HOME/.vimrc
mv -i $HOME/.vim $HOME/.vim.backup
ln -s $config_folder/vimfolder $HOME/.vim

