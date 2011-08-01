#!/bin/sh
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    filename="nautilus-dropbox_0.6.8_amd64.deb"
    else
    filename="nautilus-dropbox_0.6.8_i386.deb"    
    fi
cd /tmp
echo "Downloading Dropbox: $filename"
wget -N http://linux.dropbox.com/packages/$filename
sudo dpkg -i $filename
rm $filename
