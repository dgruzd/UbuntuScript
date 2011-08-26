#!/bin/sh
#http://www.havetheknowhow.com/Install-the-software/Install-Deluge-Headless.html

export user=$(whoami)

sudo apt-get -y install deluged deluge-webui

sudo touch /var/log/deluge-web.log
sudo chown $user:$user /var/log/deluge*


echo "DELUGED_USER=\"$user\"" | sudo tee -a /etc/default/deluge-daemon
echo "RUN_AT_STARTUP=\"YES\"" | sudo tee -a /etc/default/deluge-daemon
cd /etc/init.d/
sudo wget -N http://www.havetheknowhow.com/scripts/deluge-daemon.txt
sudo mv deluge-daemon.txt deluge-daemon
sudo chmod a+x /etc/init.d/deluge-daemon
sudo update-rc.d deluge-daemon defaults
#sudo reboot now
#localhost:8112
