#!/bin/sh
#http://beacon.wharton.upenn.edu/davekonopka/2011/07/connect-os-x-lion-time-machine-to-a-network-drive/
sudo apt-get --assume-yes install netatalk avahi-daemon wget

sudo apt-get --assume-yes install libdb4.8-dev libcrack2-dev libssl-dev
cd /tmp
wget http://sourceforge.net/projects/netatalk/files/netatalk/2.2/netatalk-2.2.0.tar.gz
tar xvf netatalk-2.2.0.tar.gz
cd netatalk-2.2.0
./configure -enable-debian -enable-zerconf
make
sudo make install

sudo sed -i 's/~\//#~\//g' /etc/netatalk/AppleVolumes.default
echo "/home/timemachine \"TimeMachine\" options:tm" | sudo tee -a /etc/netatalk/AppleVolumes.default
sudo vim /etc/netatalk/AppleVolumes.default


echo "<service-group>" | sudo tee -a /etc/avahi/services/afpd.service
echo "<name replace-wildcards=”yes”>%h</name>" | sudo tee -a /etc/avahi/services/afpd.service
echo "<service>" | sudo tee -a /etc/avahi/services/afpd.service
echo "<type>_afpovertcp._tcp</type>" | sudo tee -a /etc/avahi/services/afpd.service
echo "<port>548</port>" | sudo tee -a /etc/avahi/services/afpd.service
echo "</service>" | sudo tee -a /etc/avahi/services/afpd.service
echo "<service>" | sudo tee -a /etc/avahi/services/afpd.service
echo "<type>_device-info._tcp</type>" | sudo tee -a /etc/avahi/services/afpd.service
echo "<port>0</port>" | sudo tee -a /etc/avahi/services/afpd.service
echo "<txt-record>model=Xserve</txt-record>" | sudo tee -a /etc/avahi/services/afpd.service
echo "</service>" | sudo tee -a /etc/avahi/services/afpd.service
echo "</service-group>" | sudo tee -a /etc/avahi/services/afpd.service
 
sudo service netatalk restart
sudo service avahi-daemon restart
 
sudo adduser timemachine
 
sudo mkdir /home/timemachine
sudo chown timemachine /home/timemachine
