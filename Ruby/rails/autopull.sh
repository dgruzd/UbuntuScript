#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR
git pull origin master
touch tmp/restart.txt
