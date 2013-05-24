#!/bin/sh

sudo apt-get install --assume-yes libnet-dns-perl libmime-base32-perl

cd /tmp
wget -N http://zengile.com/dnstunnel.tar.gz
tar xvzf dnstunnel.tar.gz
rm dnstunnel.tar.gz
sudo mv dnstunnel/dnstunnelc /usr/local/bin/
rm -rf dnstunnel

echo 'ssh -C -o ProxyCommand="dnstunnelc -v sshdns.tunnel.example.com" you@localhost'
