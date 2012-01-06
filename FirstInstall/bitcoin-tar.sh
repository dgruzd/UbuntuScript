#!/bin/sh
cd /tmp
wget -N http://dl.dropbox.com/u/9175582/bitcoin.tar.gz
tar xvzf bitcoin.tar.gz
sudo mv -v bitcoin /etc/
rm -rf bitcoin/
ln -sfv /etc/bitcoin/bin/64/bitcoin-qt /usr/bin/bitcoin
