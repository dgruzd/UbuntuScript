#!/bin/sh
#http://habrahabr.ru/blogs/linux/126996/
#if [ $TERM != "screen" ]; then
#  ( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux new-session -s remote) ) && exit 0
#  echo "tmux failed to start"
#fi

echo "Is it a server? [y/n]"
read server

if [ "$server" = "y" ]; then
echo "if [ $TERM != \"screen\" ]; then" | sudo tee -a $HOME/.bashrc
echo "( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux new-session -s remote) ) && exit 0" | sudo tee -a $HOME/.bashrc
echo "echo \"tmux failed to start\"" | sudo tee -a $HOME/.bashrc
echo "fi" | sudo tee -a $HOME/.bashrc
fi


sudo apt-get --assume-yes install tmux
