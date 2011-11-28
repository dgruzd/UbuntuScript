#!/bin/bash
#http://www.cyberfight.ru/offline/articles/29248

cd /usr/local/games/ioquake3
#screen -dR q3serv ./ioq3ded.x86_64 +set fs_game osp +set sv_strictauth 0 +set sv_pure 0 +map q3dm17
#./ioq3ded.x86_64 +set com_hunkmegs 32 +set net_port 27960 +set dedicated 1 +set vm_game 2 +set vm_cgame 2 +set vm_ui 2 +set fs_game osp +set sv_strictAuth 0 +set sv_punkbuster 0 +set sv_lanForceRate 1 +set sv_maxrate 15000 +exec 1v1.cfg


#screen -A -m -d -S
screen -dR q3serv ./ioq3ded.i386 +set com_hunkmegs 32 +set net_port 27960 +set dedicated 1 +set vm_game 2 +set vm_cgame 2 +set vm_ui 2 +set fs_game osp +set sv_strictAuth 0 +set sv_punkbuster 0 +set sv_lanForceRate 1 +set sv_maxrate 15000 +seta timelimit 15 +seta fraglimit 0 +seta sv_allowDownload 1 +map q3dm17
