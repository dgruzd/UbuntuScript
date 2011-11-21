#!/bin/sh
#http://mark.koli.ch/2009/05/howto-whole-disk-backups-with-dd-gzip-and-p7zip.html
#sudo dd if=/dev/hda of=image.img
sudo dd if=/dev/hda conv=sync,noerror bs=64K | gzip -c  > hda5.img.gz
