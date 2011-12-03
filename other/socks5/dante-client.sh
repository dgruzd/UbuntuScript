#!/bin/sh
#http://habrahabr.ru/blogs/linux/133703/

sudo apt-get --assume-yes install dante-client



# Если требуется зайти по ssh на сервер
#SOCKS_PASSWORD="" SOCKS_SERVER="11.22.33.44:1080" socksify ssh myserver
# Тоже самое, только если для подключения к соксу требуется авторизация
#SOCKS_USERNAME="user" SOCKS_PASSWORD="password" SOCKS_SERVER="11.22.33.44:1080" socksify ssh myserver  
# Пример с использованием IRC клиента - irssi
#SOCKS_PASSWORD="" SOCKS_SERVER="11.22.33.44:1080" socksify irssi
# Тоже самое, только с использованием HTTP proxy с поддержкой метода CONNECT
#HTTP_CONNECT_PROXY="http://11.22.33.44:8080" socksify irssi
