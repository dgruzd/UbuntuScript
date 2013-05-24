#!/bin/sh
#http://www.splitbrain.org/blog/2008-11/02-dns_tunneling_made_simple

sudo apt-get install screen libnet-dns-perl libmime-base32-perl vim
cd /tmp
wget -N http://zengile.com/dnstunnel.tar.gz
tar xvzf dnstunnel.tar.gz
rm dnstunnel.tar.gz
sudo mkdir -pv /opt
sudo mv dnstunnel /opt/

sudo vim /opt/dnstunnel/dnstunneld.wrapper

sudo ln -sfv /opt/dnstunnel/dnstunneld.init /etc/init.d/dnstunneld
sudo /etc/init.d/dnstunneld start
