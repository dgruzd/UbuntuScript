#!/bin/sh
find app/ -type f -name "*" -exec cat {} \; | wc -l
