#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR/../

unicorn_rails -c config/unicorn.rb -E production -D
tail -n 15 log/unicorn.stderr.log
