#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
i=`$DIR/speed.rb`
notify-send -t 10000 "Crunch" "$i"
#echo $i
