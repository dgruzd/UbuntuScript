#!/bin/bash
 
lsof -n | grep /tmp/Flash | \ 
    awk '{line = "/proc/" $2 "/fd/" $4; sub("[^0-9]*$","",line); print line}' | \ 
        xargs -I '{}' cp -v '{}' -t "$@" --backup=t
