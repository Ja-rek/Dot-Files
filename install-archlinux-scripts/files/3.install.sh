#!/bin/bash

#fix firmwares
#######################
git clone https://aur.archlinux.org/aic94xx-firmware.git
cd aic94xx-firmware
makepkg -sri
cd ..
sudo rm -rf aic94xx-firmware

git clone https://aur.archlinux.org/wd719x-firmware.git
cd wd719x-firmware
makepkg -sri
cd ..
sudo rm -rf wd719x-firmware

sudo mkinitcpio -p linux
########################

sudo pacman -Syu alsa-utils nvidia mesa xorg xorg-xinit xorg-server
sudo Xorg :0 -configure
sudo cp /root/xorg.conf.new /etc/X11/xorg.conf
cp /etc/X11/xinit/xinitrc ~/.xinitrc

echo -e "\033[0;32m Done! \033[0m"
