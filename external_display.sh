#!/bin/sh
sudo nvram boot-args="iog=0x0"
#undo
sudo nvram -d boot-args
