#!/bin/bash

sudo apt-get -qq update

sudo apt-get install -qqy --no-install-recommends linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -qqy --no-install-recommends apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"

sudo apt-get -qq update
sudo apt-get -qqy install docker-engine

curl -L "https://github.com/docker/compose/releases/download/1.11.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

