#!/bin/sh
rvm get head
rvm install ruby-1.9.3-p0
rvm reload
rvm --default ruby-1.9.3-p0
