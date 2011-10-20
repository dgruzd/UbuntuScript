#!/bin/sh
#http://blogs.technet.com/b/abeshkov/archive/2011/01/30/3383495.aspx
echo "hv_vmbus" | sudo tee -a /etc/initramfs-tools/modules
echo "hv_storvsc" | sudo tee -a /etc/initramfs-tools/modules
echo "hv_blkvsc" | sudo tee -a /etc/initramfs-tools/modules
echo "hv_netvsc" | sudo tee -a /etc/initramfs-tools/modules
echo "hv_utils" | sudo tee -a /etc/initramfs-tools/modules

sudo update-initramfs -u


