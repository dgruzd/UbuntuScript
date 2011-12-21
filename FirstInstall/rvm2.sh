#!/bin/bash
# if zlib error https://rvm.beginrescueend.com/packages/zlib/

rvm install 1.9.2
rvm 1.9.2
rvm --default use 1.9.2
#disabling ri and rdoc
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
#gem install rails --no-ri --no-rdoc
gem install rails -v '3.0.9'
