#!/bin/sh
#sudo apt-get install --assume-yes python-software-properties
#sudo add-apt-repository ppa:git-core/ppa
#sudo apt-get update
sudo apt-get --assume-yes install git curl build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev ruby-dev wget subversion libcurl4-openssl-dev

#bash <<(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
cd /tmp
#wget -N https://rvm.beginrescueend.com/install/rvm
#chmod +x rvm
#mv rvm rvm.sh

wget -N https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer
mv rvm-installer rvm.sh
chmod +x rvm.sh
./rvm.sh
rm rvm.sh

echo "Starting .bashrc:"
echo "#######################################"
cat $HOME/.bashrc | grep '.rvm'
echo "#######################################"
echo "Check is above a line with rvm"

echo "Now please restart shell or open a new one and install ruby"
#echo "Ctrl + Shift + T > ./rmv2.sh"


echo "gem: --no-ri --no-rdoc" > ~/.gemrc


#seems like rvm auto add this line to .bashrc
#cp $HOME/.bashrc $HOME/.bashrc.backup
#echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && source \"$HOME/.rvm/scripts/rvm\"" >> $HOME/.bashrc
