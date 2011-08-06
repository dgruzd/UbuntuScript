#!/bin/sh

cd /tmp
wget -N http://ioquake3.org/data/quake3-latest-pk3s.zip
mkdir -pv $HOME/.q3a/baseq3

rm -v quake3-latest-pk3s.zip

echo "Type your machine type \"64\" or \"32\" bit (2 digits), followed by [ENTER]:"
read mtype
if [ "$mtype" = "64" ]; then
  wget -N http://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.x86_64.run
  LANG=C sudo sh ioquake3-1.36-7.1.x86_64.run
else
  wget -N http://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.i386.run
  LANG=C sudo sh ioquake3-1.36-7.1.i386.run
fi

rm -v ioquake3-1.36-7.1*
