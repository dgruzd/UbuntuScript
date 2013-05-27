#!/bin/bash
cd /tmp

URL=http://btsync.s3-website-us-east-1.amazonaws.com
wget32="ioquake3-1.36-7.1.i386.run"
wget64="ioquake3-1.36-7.1.x86_64.run"


MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  wget -N $URL/$wget64
else
  wget -N $URL/$wget32
fi
