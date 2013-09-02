#!/bin/sh
sudo apt-get -y install libxslt-dev libxml2-dev libpam-dev libedit-dev

cd /tmp
wget http://www.repmgr.org/download/repmgr-1.2.0.tar.gz

tar xvzf repmgr-1.2.0.tar.gz
cd repmgr-1.2.0/
make USE_PGXS=1
sudo make USE_PGXS=1 install
sudo update-alternatives --install /usr/bin/repmgr repmgr /usr/lib/postgresql/9.2/bin/repmgr 10
sudo update-alternatives --install /usr/bin/repmgrd repmgrd /usr/lib/postgresql/9.2/bin/repmgrd 10

echo "Please run if postgresql is not 9.2:"
echo "sudo update-alternatives --install /usr/bin/repmgr repmgr /usr/lib/postgresql/POSTGRESQL_VERSION/bin/repmgr 10"
echo "sudo update-alternatives --install /usr/bin/repmgrd repmgrd /usr/lib/postgresql/POSTGRESQL_VERSION/bin/repmgrd 10"
