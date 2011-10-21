#!/bin/sh
cd /tmp
#BEFORE THAT ACCEPT LICENSE AGREEMENT AT QUAKELIVE.COM
#ONLY FIREFOX
wget -N http://cdn.quakelive.com/assets/2011071901/QuakeLivePlugin_433.xpi
unzip QuakeLivePlugin_433.xpi
mkdir -pv ~/.mozilla/plugins
cp plugins/npquakelive.*.so ~/.mozilla/plugins/
rm -r install.rdf QuakeLivePlugin_433.xpi plugins/
