#!/bin/bash
gnome-default-applications-properties
filecontent=( `cat "firefox-ext.txt" `)

for t in "${filecontent[@]}"
do
gnome-open $t
done


gnome-default-applications-properties
