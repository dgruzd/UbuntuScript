#!/bin/bash
nexus_dir=/media/35EE-1E0E
backup_dir=$HOME/Desktop/Nexus-backup
mkdir -pv $backup_dir
mkdir -v $backup_dir/financisto
cd $nexus_dir
echo "starting financisto"
cp financisto/*.backup $backup_dir/financisto
echo "starting APK"
cp APK/*.apk $backup_dir
echo "starting CityGuide"
cp -r CityGuide $backup_dir
echo "starting MP3"
cp -r MP3 $backup_dir
