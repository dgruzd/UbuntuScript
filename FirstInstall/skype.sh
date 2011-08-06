#!/bin/sh
sudo sed -i 's/# deb http:\/\/archive.canonical.com\/ubuntu lucid partner/deb http:\/\/archive.canonical.com\/ubuntu lucid partner/g' /etc/apt/sources.list
sudo apt-get update && sudo apt-get --assume-yes install skype
