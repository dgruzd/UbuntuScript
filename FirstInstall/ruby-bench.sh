#!/bin/sh
time ruby -e "count = 0; while(count < 100000000); count = count + 1; end; puts count"
