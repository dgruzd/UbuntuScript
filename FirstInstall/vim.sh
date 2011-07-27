#!/bin/sh
dropbox="$HOME/Dropbox"

sudo aptitude install vim vim-gnome
mv -i $HOME/.gvimrc $HOME/.gvimrc.backup
ln -s $dropbox/config/gvimrc $HOME/.gvimrc
mv -i $HOME/.vimrc $HOME/.vimrc.backup
ln -s $dropbox/config/vimrc $HOME/.vimrc
