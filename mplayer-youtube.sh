#!/bin/sh
#
# Public domain
# Author: roman [] tsisyk.com
#
# Usage: ./me url [youtube-dl parameters]
#

#quality
# 22 - 720p
# 18 - 480p

#COOKIE_FILE=/var/tmp/youtube-dl-cookies.txt
COOKIE_FILE=~/Dropbox/Docs/youtube-dl-cookies.txt
mplayer -fs  -cache 100000 -cache-min 5 -cookies -cookies-file ${COOKIE_FILE} $(youtube-dl --max-quality=22 -g --cookies ${COOKIE_FILE} $*)
