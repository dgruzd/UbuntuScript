#!/bin/bash
#http://www.cyberfight.ru/offline/articles/29248

cd /usr/local/games/ioquake3

case "" in

start)
 nice -n 0 ./ioq3ded.x86_64 +cvar_restart 
 +set com_hunkmegs 32 
 +set net_port 27960 
 +set dedicated 1 
 +set vm_game 2 
 +set vm_cgame 2 
 +set vm_ui 2 
 +set fs_game osp 
 +set fs_homepath $HOME/.q3a-server1 
 +set sv_strictAuth 0 
 +set sv_punkbuster 0 
 +set sv_lanForceRate 1 
 +set sv_maxrate 15000 
 +exec 1v1.cfg  >&/dev/null &
 exit
 ;;
 stop)
 killall ioq3ded.x86_64
 ;;
 *)
 echo "Usage: "
 exit 1
 esac
 exit 0
