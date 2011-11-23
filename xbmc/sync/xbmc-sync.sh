#!/bin/sh
#http://lifehacker.com/5634515/how-to-synchronize-your-xbmc-media-center-across-every-room-in-the-house



#CREATE USER 'xbmc' IDENTIFIED BY 'xbmc';
CREATE database xbmc_video;

GRANT ALL ON xbmc_video.* TO 'xbmc';
SELECT host,user from mysql.user;
SHOW DATABASES;


