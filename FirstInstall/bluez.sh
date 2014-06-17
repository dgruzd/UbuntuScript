#!/bin/sh

sudo apt-get purge bluez
sudo add-apt-repository ppa:kitlaan/ppa
sudo apt-get update
sudo apt-get install bluez
