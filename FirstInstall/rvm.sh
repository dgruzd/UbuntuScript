#!/bin/sh
# For Ruby / Ruby HEAD (MRI, Rubinius, & REE), install the following:
#sudo apt-get --assume-yes install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
# Additional packages
#sudo apt-get --assume-yes install libsqlite3-0 ruby-dev wget libcurl4-openssl-dev libsasl2-dev libmemcached-dbg gettext
#sudo apt-get --assume-yes install imagemagick libmagickcore-dev libmagickwand-dev
#libmemcached-dev libmemcached-dev

curl -L get.rvm.io | bash -s stable
echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && source \"$HOME/.rvm/scripts/rvm\"" >> $HOME/.bashrc

echo "Starting .bashrc:"
echo "#######################################"
cat $HOME/.bashrc | grep '.rvm'
echo "#######################################"
echo "Check is above a line with rvm"

#echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
#source ~/.rvm/scripts/rvm


# http://habrahabr.ru/post/160371/
# echo "rvm_configure_env=(CFLAGS=-03)" > ~/.rvmrc
# rvm reinstall your.ruby.version

# rvm install 1.9.3 -n perf --patch falcon
