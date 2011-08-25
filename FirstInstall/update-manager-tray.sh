#!/bin/sh
gconftool -s --type bool /apps/update-notifier/auto_launch false
gconftool -s --type int /apps/update-notifier/regular_auto_launch_interval 1
gconftool -s --type bool /apps/update-manager/show_versions true
