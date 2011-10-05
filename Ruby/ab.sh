#!/bin/sh
sudo apt-get --assume-yes install apache2-utils
echo "############# ab -n 10 -c 5 http://yandex.ru:80/"
