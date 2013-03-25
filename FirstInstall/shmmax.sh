#!/bin/bash

#http://www.unixmen.com/shmmax-share-linux-memory/


#cat /proc/sys/kernel/shmmax


MB=4048
let SHMMAX=MB*1024*1024
echo $SHMMAX

#echo $SHMMAX | sudo tee /proc/sys/kernel/shmmax
sudo sysctl -w kernel.shmmax=$SHMMAX
echo "kernel.shmmax=$SHMMAX" | sudo tee -a /etc/sysctl.conf
sudo vim /etc/sysctl.conf
