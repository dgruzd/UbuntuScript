#!/bin/bash


# Install wifi hotspot daemon and dns/dhcp server
sudo apt-get --assume-yes install hostapd dnsmasq
# Stop installed services
sudo service hostapd stop
sudo service dnsmasq stop
# Disable autostart on boot
sudo update-rc.d hostapd disable
sudo update-rc.d dnsmasq disable


sudo cp -iv hostapd.conf /etc/hostapd.conf

sudo cp -iv dnsmasq.conf /etc/dnsmasq.conf
