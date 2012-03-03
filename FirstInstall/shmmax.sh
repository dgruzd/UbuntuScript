#!/bin/bash

#http://www.unixmen.com/shmmax-share-linux-memory/


#cat /proc/sys/kernel/shmmax


MB=512
let SHMMAX=MB*1024*1024
echo $SHMMAX

echo $SHMMAX | sudo tee /proc/sys/kernel/shmmax
echo "kernel.shmmax=$SHMMAX" | sudo tee -a /etc/sysctl.conf
sudo vim /etc/sysctl.conf
