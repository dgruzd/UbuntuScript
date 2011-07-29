#!/bin/sh
sudo apt-get install git
echo  "RUN bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"
#echo -e "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && source \"$HOME/.rvm/scripts/rvm\"" >> $HOME/.bashrc
cp $HOME/.bashrc $HOME/.bashrc.backup
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # LoadRVM function' >> $HOME/.bashrc
