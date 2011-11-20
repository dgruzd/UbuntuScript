#!/bin/sh
#http://oss-it.ru/129
#https://help.ubuntu.com/community/Internet/ConnectionSharing



#
# Константы
# Интерфейс смотрящий в интернет
INET_IFACE="wlan0"
#
# Сброс всех правил
sudo iptables -F INPUT
sudo iptables -F FORWARD
sudo iptables -F OUTPUT
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
#
# Включаем режим прозрачности
iptables -t nat -A POSTROUTING -o $INET_IFACE -j MASQUERADE
#
# Включаем режим пересылки пакетов
#echo "1" > /proc/sys/net/ipv4/ip_forward
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"



sudo iptables-save | sudo tee /etc/iptables.sav
echo "iptables-restore < /etc/iptables.sav" | sudo tee -a /etc/rc.local
sudo apt-get install aptitude
sudo aptitude install vim
sudo vim /etc/rc.local

#/etc/sysctl.conf
echo "net.ipv4.conf.default.forwarding=1" | sudo tee -a /etc/svsctl.conf
echo "net.ipv4.conf.all.forwarding=1" | sudo tee -a /etc/svsctl.conf
sudo vim /etc/sysctl.conf
