#!/bin/sh

mkdir -pv $HOME/.ssh
cd $HOME/.ssh
#BACKUP OLD KEYS
mkdir key_backup
cp id_rsa* key_backup
rm id_rsa*
#GENERATE KEYS
ssh-keygen -t rsa -C "donotsendhere@gmail.com"
echo "COPY YOUR PUB KEY INTO GITHUB:"
cat id_rsa.pub
echo "##############################"
