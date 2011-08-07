#!/bin/sh
echo "Type your machine type \"64\" or \"32\" bit (2 digits), followed by [ENTER]:"
read mtype


mkdir -pv $HOME/.q3a/baseq3
mkdir -pv $HOME/.q3a/missionpack
cd /tmp
#http://ioquake3.org/extras/patch-data/
wget -N http://dl.dropbox.com/u/9513848/quake3-latest-pk3s.zip
wget -N http://dl.dropbox.com/u/9513848/PAK0.PK3
mv -v PAK0.PK3 $HOME/.q3a/baseq3
unzip quake3-latest-pk3s.zip
rm -v quake3-latest-pk3s.zip
cd quake3-latest-pk3s
cp -v baseq3/* $HOME/.q3a/baseq3 
cp -v missionpack/* $HOME/.q3a/missionpack
rm -rf quake3-latest-pk3s/
if [ "$mtype" = "64" ]; then
  wget -N http://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.x86_64.run
  LANG=C sudo sh ioquake3-1.36-7.1.x86_64.run
else
  wget -N http://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.i386.run
  LANG=C sudo sh ioquake3-1.36-7.1.i386.run
fi
rm -v ioquake3-1.36-7.1*
