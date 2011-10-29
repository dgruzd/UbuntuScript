#!/bin/sh
find app/models/ app/controllers/ -iname "*.rb" -exec ./rbeautify {} \;
