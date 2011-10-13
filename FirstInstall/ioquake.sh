#!/bin/sh
q3config="$HOME/.q3a/baseq3/autoexec.cfg"
wget32="ioquake3-1.36-7.1.i386.run"
wget64="ioquake3-1.36-7.1.x86_64.run"


echo "Type your machine type \"64\" or \"32\" bit (2 digits), followed by [ENTER]:"
read mtype
echo "Type your nickname:"
read nick
echo "Type your resolution width, for 1280x1024 it is 1280:"
read width
echo "Type your resolution height for 1280x1024 it is 1024:"
read height

sudo apt-get --assume-yes install axel unzip
#mv -v .q3a .q3a-backup

mkdir -pv $HOME/.q3a/baseq3
mkdir -pv $HOME/.q3a/missionpack

echo "seta name \"$nick\"" | tee -a $q3config
echo "r_customWidth $width" | tee -a $q3config
echo "r_customHeight $height" | tee -a $q3config
echo "r_mode -1" | tee -a $q3config
echo "vid_restart" | tee -a $q3config

cd /tmp
#http://ioquake3.org/extras/patch-data/
#wget -N http://dl.dropbox.com/u/9513848/quake3-latest-pk3s.zip
axel http://dl.dropbox.com/u/9513848/quake3-latest-pk3s.zip
#quake gold cd
#wget -N http://dl.dropbox.com/u/9513848/PAK0.PK3
axel http://dl.dropbox.com/u/9513848/PAK0.PK3
mv -v PAK0.PK3 $HOME/.q3a/baseq3
unzip quake3-latest-pk3s.zip && rm -v quake3-latest-pk3s.zip
cd quake3-latest-pk3s
cp -v baseq3/* $HOME/.q3a/baseq3 
cp -v missionpack/* $HOME/.q3a/missionpack
rm -rf quake3-latest-pk3s/
if [ "$mtype" = "64" ]; then
  wget -N http://ioquake3.org/files/1.36/installer/$wget64
  LANG=C sudo sh $wget64 
else
  wget -N http://ioquake3.org/files/1.36/installer/$wget32 
  LANG=C sudo sh $wget32 
fi

rm -v ioquake3-1*
