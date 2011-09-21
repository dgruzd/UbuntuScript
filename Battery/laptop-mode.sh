#!/bin/sh
#http://www.cyberciti.biz/faq/linux-laptop-power-saving/
#http://www.lesswatts.org/

#echo "latop mode is"
#cat /proc/sys/vm/laptop_mode
echo "Enabling laptop mode:"
echo 5 | sudo tee -a /proc/sys/vm/laptop_mode
