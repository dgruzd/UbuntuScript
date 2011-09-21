#!/bin/sh
sudo mkdir -pv /var/www

sudo apt-get --assume-yes install apache2
sudo apt-get --assume-yes install php5 libapache2-mod-php5

sudo /etc/init.d/apache2 restart

echo "<?php phpinfo(); ?>" | sudo tee -a /var/www/testphp.php
