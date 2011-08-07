#!/bin/sh
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install --assume-yes git

git config --global user.name "Dmitry Gruzd"
git config --global user.email "donotsendhere@gmail.com" 
git config --global core.editor "vim"
