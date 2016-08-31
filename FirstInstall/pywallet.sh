#!/bin/sh

sudo apt-get update
sudo apt-get install -y  build-essential python-dev python-twisted python-bsddb3 git-core

git clone https://github.com/jackjack-jj/pywallet.git


# sudo ./pywallet.py --recover --recov_device /dev/sdb1 --recov_size 1Gio --recov_outputdir /home/nyaa/
