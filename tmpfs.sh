#!/bin/sh

TEMP_DIR="/media/tmpfs"
SIZE="1G"

if [ "$1" = "-u" ]; then
  sudo umount $TEMP_DIR
  sudo rmdir -v $TEMP_DIR
else
  sudo mkdir $TEMP_DIR
  sudo mount -t tmpfs -o size=$SIZE,nr_inodes=10k,mode=0700 tmpfs $TEMP_DIR
  sudo chown `whoami`:`whoami` $TEMP_DIR
  df -h | grep 'tmpfs'
fi




#mount -o remount,size=2G /media/tmpfs
