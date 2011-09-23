#!/bin/sh
sudo apt-get --assume-yes install moc 
mkdir -pv $HOME/.moc
#cp -v /usr/share/doc/moc/examples/config.example.gz $HOME/.moc/
#cd $HOME/.moc
#sudo chown $USER config.example.gz
#gunzip config.example.gz
#mv config.example config
#sed -i 's/WINDOWS-1250/WINDOWS-1251/g' $HOME/.moc/config
#sed -i 's/#ID3v1TagsEncoding/ID3v1TagsEncoding/g' $HOME/.moc/config
#sed -i 's/# XTermTheme/XTermTheme/g' $HOME/.moc/config


cp /usr/share/doc/moc/examples/config.example.gz ~/.moc/
cd ~/.moc
export user=$(whoami)
sudo chown $user:$user config.example.gz
gunzip config.example.gz
mv config.example config
