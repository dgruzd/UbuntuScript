#!/bin/sh
rvm get head
echo "rvm_configure_env=(CFLAGS=-O3)" > ~/.rvmrc
rvm install 1.9.3 -n perf --patch falcon
