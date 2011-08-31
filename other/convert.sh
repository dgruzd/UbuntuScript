#!/bin/sh
mkdir -pv $HOME/Desktop/Supa_MP3/mp3
find $HOME/Dropbox/Supa_Music -iname "*.mp3" -exec cp -vi {} $HOME/Desktop/Supa_MP3/mp3/ \;
find $HOME/Dropbox/Supa_Music -iname "*.flac" -exec cp -vi {} $HOME/Desktop/Supa_MP3/ \;
