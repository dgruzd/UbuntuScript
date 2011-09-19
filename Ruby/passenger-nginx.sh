#!/bin/sh
#http://www.modrails.com/documentation/Users%20guide%20Nginx.html

#passenger-config --root

#Curl development headers with SSL support
sudo apt-get --assume-yes install libcurl4-openssl-dev
rvmsudo passenger-install-nginx-module

cd
git clone git://github.com/jnstq/rails-nginx-passenger-ubuntu.git
sudo cp -v rails-nginx-passenger-ubuntu/nginx/nginx /etc/init.d/nginx
sudo chown root:root /etc/init.d/nginx
rm -rf rails-nginx-passenger-ubuntu/

#sudo /usr/sbin/update-rc.d -f nginx defaults
sudo gedit /opt/nginx/conf/nginx.conf

sudo /etc/init.d/nginx restart

#	server {
#        listen 80;
#        server_name www.mycook.com;
#        root /web/some_app/public;
#        passenger_enabled on;
#    	}
