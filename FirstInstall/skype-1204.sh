#!/bin/sh
sudo apt-add-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner" && sudo apt-get update && sudo apt-get --assume-yes install skype
