#!/bin/sh
sudo apt-get install git curl
echo  "RUN bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"
cp $HOME/.bashrc $HOME/.bashrc.backup
echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && source \"$HOME/.rvm/scripts/rvm\"" >> $HOME/.bashrc
