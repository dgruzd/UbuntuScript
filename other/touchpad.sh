#!/bin/sh
echo "options psmouse proto=imps" | sudo tee -a /etc/modprobe.d/psmouse.conf
