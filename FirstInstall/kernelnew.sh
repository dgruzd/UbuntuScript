#!/bin/sh
sudo add-apt-repository ppa:kernel-ppa/ppa
sudo apt-get update
#apt-cache showpkg linux-headers
sudo apt-get install linux-headers-2.6.38-10 linux-headers-2.6.38-10-generic linux-image-2.6.38-10-generic --fix-missing
