#!/bin/sh
cd /tmp
#wget ftp://ftp.delegate.org/pub/DeleGate/delegate9.2.4.tar.gz
wget -N http://dl.dropbox.com/u/9175582/delegate9.9.7.tar.gz

gzip -d < delegate9.9.7.tar.gz | tar xfv -
cd delegate9.9.7
make
