#!/bin/sh

cd $HOME
wget http://www.dropbox.com/download?plat=lnx.x86_64 -O dropbox64.tgz
tar xvzf dropbox64.tgz && rm dropbox64.tgz
echo '~/.dropbox-dist/dropboxd'

