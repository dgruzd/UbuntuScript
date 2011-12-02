#!/bin/sh
echo "route {" | sudo tee -a /etc/socks.conf
echo "from: 0.0.0.0/0   to: 0.0.0.0/0   via: localhost port = 1488" | sudo tee -a /etc/socks.conf
echo "protocol: tcp udp" | sudo tee -a /etc/socks.conf
echo "proxyprotocol: socks_v4 socks_v5" | sudo tee -a /etc/socks.conf
echo "method: none" | sudo tee -a /etc/socks.conf
echo "}" | sudo tee -a /etc/socks.conf
