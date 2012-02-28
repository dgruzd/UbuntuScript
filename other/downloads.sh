#!/bin/sh
#mkdir -pv $HOME/Desktop
cp $HOME/.config/user-dirs.dirs $HOME/.config/user-dirs.dirs.backup
sed -i 's/Загрузки/Downloads/g' $HOME/.config/user-dirs.dirs
mv -iv $HOME/Загрузки $HOME/Downloads
