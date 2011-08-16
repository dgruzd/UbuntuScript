#!/bin/bash

filecontent=( `cat "firefox-ext.txt" `)

for t in "${filecontent[@]}"
do
gnome-open $t
done
