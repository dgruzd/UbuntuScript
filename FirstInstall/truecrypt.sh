#!/bin/sh
cd /tmp
wget -N http://www.truecrypt.org/download/truecrypt-7.0a-linux-x64.tar.gz
tar xvfz truecrypt-7.0a-linux-x64.tar.gz
./truecrypt-7.0a-setup-x64
rm -v truecrypt-7.0a-setup-x64 truecrypt-7.0a-linux-x64.tar.gz
