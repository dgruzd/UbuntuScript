#!/bin/sh

gunzip -c /mnt/sda1/hda.img.gz | sudo dd of=/dev/hda conv=sync,noerror bs=64K
