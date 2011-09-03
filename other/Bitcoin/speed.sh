#!/bin/bash
#DIR="$( cd "$( dirname "$0" )" && pwd )"
i=`bitspeed`
DISPLAY=:0 notify-send -t 5000 "Crunch" "$i"
#echo $i
