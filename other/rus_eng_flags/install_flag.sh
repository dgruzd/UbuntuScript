#!/bin/sh
mkdir -pv ~/.icons/flags
cp ru.svg ~/.icons/flags
cp us.png ~/.icons/flags
gconftool-2 --type bool --set /desktop/gnome/peripherals/keyboard/indicator/showFlags true
