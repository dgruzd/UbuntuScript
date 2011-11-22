#!/bin/sh

sudo apt-get install php5-cli php5-cgi build-essential

#location ~ \.php$ {
#  include /etc/nginx/fastcgi_params;
#  fastcgi_pass 127.0.0.1:9000;
#  fastcgi_index index.php;
#  fastcgi_param SCRIPT_FILENAME /var/www/nginx-default$fastcgi_script_name;
#}

cd /tmp
wget http://www.lighttpd.net/download/lighttpd-1.4.18.tar.bz2
tar -xvjf lighttpd-1.4.18.tar.bz2
cd lighttpd-1.4.18
./configure
make
sudo cp src/spawn-fcgi /usr/bin/spawn-fcgi

cd /usr/bin
sudo wget -N https://raw.github.com/nyaa/UbuntuScript/master/php5-nginx/php-fastcgi
sudo chmod 755 /usr/bin/php-fastcgi

cd /etc/init.d/
sudo wget -N https://raw.github.com/nyaa/UbuntuScript/master/php5-nginx/init-fastcgi
sudo chmod 755 /etc/init.d/init-fastcgi

sudo /etc/init.d/init-fastcgi start

sudo netstat -tulpn | grep :9000


#sudo update-rc.d init-fastcgi defaults
#sudo /etc/init.d/nginx restart
