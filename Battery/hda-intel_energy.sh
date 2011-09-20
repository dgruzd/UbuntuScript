#!/bin/sh
#http://www.lesswatts.org/tips/misc.php
echo "Enabling power safe hda soundcard"
echo 10 | sudo tee -a /sys/module/snd_hda_intel/parameters/power_save

cat /sys/module/snd_hda_intel/parameters/power_save
