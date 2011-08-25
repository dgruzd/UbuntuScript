#!/bin/sh
echo "Enter your user.name for git"
read name
if [ "$name" ];then
echo "$name"
else
name = "Dmitry Gruzd"
fi
echo "Enter your email for git"
read email
if [ "$email" ]; then
echo "$email"
else
email = "donotsendhere@gmail.com"
fi

sudo apt-get install --assume-yes python-software-properties
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install --assume-yes git

git config --global user.name "$name"
git config --global user.email "$email" 
git config --global core.editor "vim"
#default is 512m
#git config core.bigFileThreshold 10m 
#default is 8g
#git config core.packedGitLimit 5g 



echo "Do you want to generate ssh keys for github?[y/n]"
read keys
if [ "$keys" = "y" ]; then
mkdir -pv $HOME/.ssh
cd $HOME/.ssh
#BACKUP OLD KEYS
mkdir key_backup
cp id_rsa* key_backup
rm id_rsa*
#GENERATE KEYS
ssh-keygen -t rsa -C "$email"
echo "COPY YOUR PUB KEY INTO GITHUB:"
cat id_rsa.pub
echo "##############################"
else
echo "OK"
fi
