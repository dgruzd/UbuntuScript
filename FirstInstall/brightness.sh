#!/bin/sh
sudo cp -v /etc/default/grub /etc/default/grub.backupbrightness
sudo sed -i 's/GRUB_CMDLINE_LINUX=\"\"/GRUB_CMDLINE_LINUX=\"acpi_osi=Linux\"/g' /etc/default/grub
sudo update-grub
