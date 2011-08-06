#!/bin/sh
sudo add-apt-repository ppa:deluge-team/ppa
sudo apt-get update

sudo apt-get install deluge deluged deluge-console

deluged
deluge -u console
#>>>>>>>>> config -s allow_remote True
#>>>>>>>>> exit

killall deluged
echo "username:password" >> ~/.config/deluge/auth
deluged
