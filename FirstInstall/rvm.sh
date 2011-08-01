#!/bin/sh
sudo apt-get install git curl
sudo apt-get install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev
echo "RUN TEXT ABOVE: VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
echo  "bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "Starting .bashrc:"
cat $HOME/.bashrc | grep '.rvm'
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "PLEASE LOOK IS THERE A LINE WITH RVM"
#seems like rvm auto add this line to .bashrc
#cp $HOME/.bashrc $HOME/.bashrc.backup
#echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && source \"$HOME/.rvm/scripts/rvm\"" >> $HOME/.bashrc
