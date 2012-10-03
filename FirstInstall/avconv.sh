#!/bin/sh
sudo apt-get --assume-yes install libavcodec-extra-53
#IPAD
#avconv -i <pathofvideo>.mkv -vcodec libx264 -acodec libvo_aacenc -r 30000/1001 <outputfilename>.mp4
