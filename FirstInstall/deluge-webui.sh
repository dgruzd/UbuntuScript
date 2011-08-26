#!/bin/sh
#http://www.havetheknowhow.com/Install-the-software/Install-Deluge-Headless.html
sudo add-apt-repository ppa:deluge-team/ppa
sudo apt-get update
export user=$(whoami)

sudo apt-get -y install deluged deluge-webui

sudo touch /var/log/deluge-web.log
sudo chown $user:$user /var/log/deluge*

echo "# Configuration for /etc/init.d/deluge-daemon" | sudo tee -a /etc/default/deluge-daemon
echo "# The init.d script will only run if this variable non-empty." | sudo tee -a /etc/default/deluge-daemon
echo "DELUGED_USER=\"$user\"" | sudo tee -a /etc/default/deluge-daemon
echo "# Should we run at startup?" | sudo tee -a /etc/default/deluge-daemon
echo "RUN_AT_STARTUP=\"YES\"" | sudo tee -a /etc/default/deluge-daemon

#cd /etc/init.d/
#sudo wget -N http://www.havetheknowhow.com/scripts/deluge-daemon.txt

sudo mv -v ./deluge-daemon /etc/init.d/deluge-daemon
sudo chmod 755 /etc/init.d/deluge-daemon

sudo update-rc.d deluge-daemon defaults

sudo invoke-rc.d deluge-daemon start
#localhost:8112
