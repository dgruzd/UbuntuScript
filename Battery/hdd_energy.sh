#!/bin/sh
#http://www.lesswatts.org/tips/disks.php
#sudo hdparm -i /dev/sda

echo "To put the disk into the most aggressive power savings mode after 60 seconds of idle time:"
sudo hdparm -B 1 -S 12 /dev/sda


#cat /proc/sys/vm/dirty_writeback_centisecs
echo "Setting hdd write timeout to 80seconds"
echo 8000 | sudo tee -a /proc/sys/vm/dirty_writeback_centisecs
