#!/bin/sh
mkdir -pv $HOME/Desktop
cp $HOME/.config/user-dirs.dirs $HOME/.config/user-dirs.dirs.backup
sed -i 's/Рабочий стол/Desktop/g' $HOME/.config/user-dirs.dirs
