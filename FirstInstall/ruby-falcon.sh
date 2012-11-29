#!/bin/sh
rvm get head
echo "rvm_configure_env=(CFLAGS=-03)" > ~/.rvmrc
#echo 'rvm_configure_env=(CFLAGS="-march=native -O2")' > ~/.rvmrc
rvm install 1.9.3 -n perf --patch falcon
