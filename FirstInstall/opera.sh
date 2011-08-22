#!/bin/bash
echo "deb http://deb.opera.com/opera/ stable non-free" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get --assume-yes --force-yes install opera
