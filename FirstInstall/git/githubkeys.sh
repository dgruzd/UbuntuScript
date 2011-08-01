#!/bin/sh
email = "donotsendhere@gmail.com"

cd $HOME/.ssh
#BACKUP OLD KEYS
mkdir key_backup
cp id_rsa* key_backup
rm id_rsa*
#GENERATE KEYS
ssh-keygen -t rsa -C "$email"
echo "COPY YOUR PUB KEY INTO GITHUB:"
cat id_rsa.pub


