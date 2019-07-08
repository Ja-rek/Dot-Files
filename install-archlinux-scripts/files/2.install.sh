#!/bin/bash

NICK="jk"
HOSTNAME="jk-pc"
GROUP="users"
LOCALEGEN=("en_GB.UTF-8" "pl_PL.UTF-8")
DISK="/dev/sda"

echo 'LANG=en_GB.UTF-8' > /etc/locale.conf
echo 'KEYMAP=pl' > /etc/vconsole.conf

ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc

cp files/locale.gen /etc/locale.gen
for i in "${LOCALEGEN[@]}"
do
	sed -i "s/#$i/$i/g" /etc/locale.gen
done

locale-gen

cp files/hosts /etc/hosts
echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME" >> /etc/hosts
echo "$HOSTNAME" > /etc/hostname

echo "Set password for root"
passwd
useradd -m -g $GROUP -s /bin/zsh $NICK
echo "$NICK ALL=(ALL) ALL" > /etc/sudoers.d/$NICK
echo "Set password for $NICK"
passwd $NICK

nvim /etc/mkinitcpio.conf

mkinitcpio -p linux

grub-install --target=i386-pc $DISK
grub-mkconfig -o /boot/grub/grub.cfg

cp files/3.install.sh /home/jk
chown $NICK:$GROUP /home/jk/3.install.sh

echo -e "\033[0;31m Umount all devices and reboot machine. After that run /home/$NICK/3.install.sh. \033[0m"
read -p "" 
