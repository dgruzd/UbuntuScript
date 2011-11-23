#!/bin/bash
# if zlib error https://rvm.beginrescueend.com/packages/zlib/

rvm install 1.8.6
#disabling ri and rdoc
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
#gem install rails --no-ri --no-rdoc
