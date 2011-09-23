#!/bin/sh

MOUNT_PATH=/home/user
CONNECT=test@test.com
REMOTE_PATH=/home/user
PORT=22

if [ "$1" = "-u" ]; then
  fusermount -u -z $MOUNT_PATH
else
  sshfs -C -p $PORT $CONNECT:$REMOTE_PATH $MOUNT_PATH
fi

