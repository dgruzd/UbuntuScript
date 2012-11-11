#!/bin/sh
#http://www.blogymate.com/post.aspx?blogid=2739&t=How-to-Empty-the-Trash-of-Ubuntu-Automatically?
sudo add-apt-repository ppa:bneijt/ppa
sudo apt-get update
sudo apt-get install autotrash
#/usr/bin/autotrush -d 30
#crontab -e
#@daily /usr/bin/autotrash -d 30
