#!/bin/sh
sudo add-apt-repository ppa:kernel-ppa/ppa
sudo apt-get update
#apt-cache showpkg linux-headers

#sudo apt-get install linux-headers-2.6.39-0 linux-headers-2.6.39-0-generic linux-image-2.6.39-0-generic --fix-missing
sudo apt-get install linux-headers-2.6.38-10 linux-headers-2.6.38-10-generic linux-image-2.6.38-10-generic --fix-missing


# http://kernel.ubuntu.com/~kernel-ppa/mainline/
# http://kernel.ubuntu.com/~kernel-ppa/mainline/v2.6.39.3-oneiric/
#wget -N http://kernel.ubuntu.com/~kernel-ppa/mainline/v2.6.39.3-oneiric/linux-headers-2.6.39-02063903_2.6.39-02063903.201107091121_all.deb
#wget -N http://kernel.ubuntu.com/~kernel-ppa/mainline/v2.6.39.3-oneiric/linux-headers-2.6.39-02063903-generic_2.6.39-02063903.201107091121_amd64.deb
#wget -N http://kernel.ubuntu.com/~kernel-ppa/mainline/v2.6.39.3-oneiric/linux-image-2.6.39-02063903-generic_2.6.39-02063903.201107091121_amd64.deb
#sudo dpkg -i linux-headers-*-all.deb
#sudo dpkg -i linux-headers-*-generic-*.deb
#sudo dpkg -i linux-image-*.deb
