#!/bin/sh
cd /tmp
wget http://apache-mirror.rbc.ru/pub/apache/hbase/stable/hbase-0.94.11.tar.gz
tar xvzf hbase-0.94.11.tar.gz
sudo mv hbase-0.94.11 /etc/hbase

echo "Exporting hbase values to .bashrc"
echo "export HBASE_HOME=/etc/hbase" | sudo tee -a /etc/profile
echo "export PATH=\${PATH}:\${HBASE_HOME}/bin" | sudo tee -a /etc/profile
#sudo ln -sfv /etc/hbase/bin/hbase /usr/local/bin/hbase
