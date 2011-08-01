#!/bin/sh

# if zlib error https://rvm.beginrescueend.com/packages/zlib/


sudo apt-get install sqlite3 libsqlite3-dev
#rvm install 1.9.2

# FIX zlib problem
rvm pkg install zlib
#rvm remove 1.9.2
rvm install 1.9.2
