#!/bin/sh
config_folder="$HOME/Script/config/vim"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#mv -i $HOME/.gvimrc $HOME/.gvimrc.backup
ln -vi -s $config_folder/gvimrc $HOME/.gvimrc
#mv -i $HOME/.vimrc $HOME/.vimrc.backup
ln -vi -s $config_folder/gvimrc $HOME/.vimrc
#mv -i $HOME/.vim $HOME/.vim.backup
ln -vi -s $config_folder/vimfolder $HOME/.vim

