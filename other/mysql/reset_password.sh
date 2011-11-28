#!/bin/sh
#http://ubuntu.flowconsult.at/en/mysql-set-change-reset-root-password/
sudo /etc/init.d/mysql stop
sleep 5
sudo mysqld --skip-grant-tables &
echo "UPDATE user SET Password=PASSWORD('YOURNEWPASSWORD') WHERE User='root'; FLUSH PRIVILEGES; exit;" | tee -a /tmp/mysql_reset.sql
gedit /tmp/mysql_reset.sql
mysql -u root mysql
