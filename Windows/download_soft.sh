#!/bin/sh
machine_type="64"

mkdir -pv $HOME/Windows_Soft
cd $HOME/Windows_Soft

# 32 bit
#wget -N http://mse.dlservice.microsoft.com/download/7/6/0/760B9188-4468-4FAD-909E-4D16FE49AF47/ruRU/x86/mseinstall.exe
# 64 bit
wget -N http://mse.dlservice.microsoft.com/download/7/6/0/760B9188-4468-4FAD-909E-4D16FE49AF47/ruRU/amd64/mseinstall.exe


# Chrome
wget -N "https://dl.google.com/tag/s/appguid={8A69D345-D564-463C-AFF1-A69D9E530F96}&iid={44EAD34C-5E87-7091-10AE-0F18ADB278B5}&lang=ru&browser=3&usagestats=0&appname=Google%20Chrome&needsadmin=false/update2/installers/ChromeSetup.exe"




