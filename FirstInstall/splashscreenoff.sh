#!/bin/sh
sudo cp -v /etc/default/grub /etc/default/grub.backupsplash
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\"/g' /etc/default/grub
sudo update-grub
