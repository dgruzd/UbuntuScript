#!/bin/sh
gconftool-2 –set /apps/gnome-terminal/profiles/Default/default_size_columns –type integer 135

gconftool-2 –set \
/apps/gnome-terminal/profiles/Default/default_size_rows \
–type integer 25
