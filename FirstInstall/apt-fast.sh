#!/bin/sh
#http://www.mattparnell.com/linux/apt-fast/
#http://itbuben.org/blog/Unix-way/1525.html
sudo apt-get --assume-yes install axel
cd /usr/bin
sudo curl http://www.mattparnell.com/linux/apt-fast/apt-fast.sh -o "apt-fast"
sudo chmod +x apt-fast
