#!/bin/bash

DISK="/dev/sda"

loadkeys /usr/share/kbd/keymaps/i386/qwerty/pl.map.gz
timedatectl set-ntp true

cfdisk $DISK #Create 4 partitions.

mkfs.ext4 ${DISK}1 #boot
mkswap ${DISK}2 #swap
mkfs.ext4 ${DISK}3 #system
mkfs.ext4 ${DISK}4 #home

mount ${DISK}3 /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount ${DISK}1 /mnt/boot
mount ${DISK}4 /mnt/home
swapon ${DISK}2

vim /mnt/etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel os-prober grub sudo networkmanager dialog zsh git neovim ranger
genfstab -U /mnt > /mnt/etc/fstab

mkdir /mnt/home/install-script
cp -a files /mnt/home/install-script
cp /mnt/home/install-script/files/2.install.sh /mnt/home/install-script/2.install.sh
rm /mnt/home/install-script/files/2.install.sh

echo -e "\033[0;31m Press enter for switch to chroot. After that, run /home/install-scripts/2.install.sh. \033[0m"
read -p "" 
arch-chroot /mnt
