# SNAPSHOT CONFIGURATION WITH BTRFS FILESYSTEM

## arch Installation
After creating and formatting partitions with fdisk:
mount root partition on /mnt
	mount /dev/<ROOT_DEVICE> /mnt
create sub volumes
	btfrs su cr /mnt/@
	btfrs su cr /mnt/@home
	btfrs su cr /mnt/@snapshots
	btfrs su cr /mnt/@var_log
unmount root directory
	umount /mnt/ 
mount root subvolume
	mount -o noatime,compress=zstd,space_cache=v2,subvol=@ /dev/<ROOT_DEVICE> /mnt
Create directories 
	mkdir -p /mnt/{boot,home,.snapshots,var/log}
create other sub volumes
	mount -o noatime,compress=zstd,space_cache=v2,subvol=@home /dev/<ROOT_DEVICE> /mnt/home
	mount -o noatime,compress=zstd,space_cache=v2,subvol=@snapshots /dev/<ROOT_DEVICE> /mnt/.snapshots
	mount -o noatime,compress=zstd,space_cache=v2,subvol=@var_log /dev/<ROOT_DEVICE> /mnt/var/log
mount efi partition
mount /dev/vda1 /mnt/boot
Install base software
	pacstrap /mnt base linux linux-firmware gvim intel-ucode bash-completion reflector
Generate fstab
	genfstab -U /mnt >> /mnt/etc/fstab
Enter installation directory
	arch-chroot /mnt
Timezone
	ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
	hwclock --systohc
Edit locale.gen file
	vim /etc/locale.gen
Uncomment locale that is needed (en_GB.UTF-8)

Generate locale
	locale-gen
	echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
	echo "KEYMAP=uk" >> /etc/vconsole.conf
	echo "FONT=ter-128b" >> /etc/vconsole.conf

Configure network
	vim /etc/hostname
and enter the name of the host <HOSTNAME>
	vim /etc/hosts
	127.0.0.1    localhost
	::1          localhost
	127.0.1.1    <HOSTNAME>.localdomain   <HOSTNAME>

Password for root user
	passwd

Install necessary software
	pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools git reflector snapper bluez bluez-utils cups hplip xdg-utils xdg-user-dirs alsa-utils pulseaudio pulseaudio-bluetooth inetutils base-devel linux-headers terminus-font

Edit /etc/mkinitcpetfonto.conf file - line 7
	MODULES=(btrfs)
Regenerate kernel image
	mkinitcpio -p linux
Install grub bootloader
	grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
	grub-mkconfig -o /boot/grub/grub.cfg

Enable system services
	systemctl enable NetworkManager
	systemctl enable bluetooth
	systemctl enable cups

Add user
	useradd -mG wheel <USERNAME>
	passwd <USERNAME>
	EDITOR=vim visudo			# Uncomment wheel group

Exit installation
	exit

Unmount partitions
	umount -a
	reboot

## New Installation Following reboot
Set font to reasonable size
	setfont ter-120b

Check for internet connection
	ip -c a


For wireless connection
	nmtui

Reconfigure snapshots directory

        sudo umount /.snapshots
        sudo rm -r /.snapshots
        sudo snapper -c root create-config /
        sudo btrfs subvolume delete /.snapshots
        sudo mkdir /.snapshots
        sudo mount -a
        sudo chmod 750 /.snapshots
        sudo vim /etc/snapper/configs/root
		Add <USERNAME> ALLOW_USERS variable

In the limits for timeline cleanup group change to

		TIMELINE_MIN_AGE="1000"
		TIMELINE_LIMIT_HOURLY="5"
		TIMELINE_LIMIT_DAILY="7"
		TIMELINE_LIMIT_WEEKLY="0"
		TIMELINE_LIMIT_MONTHLY="0"
		TIMELINE_LIMIT_YEARLY="0"

Start snapper timer

        sudo systemctl enable --now snapper-timeline.timer
        sudo systemctl enable --now snapper-cleanup.timer

Install yay and associated packages

        git clone https://aur.archlinux.org/yay-bin
        cd yay-bin
        makepkg -si
        cd
        yay -S snap-pac-grub snapper-gui-git

Install these packages

        sudo pacman -S xf86-video-intel xorg i3 sddm firefox

Enable login manager (in this case sddm)

        sudo systemctl enable sddm

Edit pacman hooks to run backup of boot directory

        sudo mkdir /etc/pacman.d/hooks
        sudo vim /etc/pacman.d/hooks/50-bootbackup.hook
            [Trigger]
            Operation = Upgrade
            Operation = Install
            Operation = Remove
            Type = Path
            Target = boot/*

            [Action]
            Depends = rsync
            Description = Backing up /boot .....
            When = PreTansaction
            Exec = /usr/bin/rsync -a --delete /boot /.bootbackup

Install rsync

        sudo pacman -S rsync

Generate grub configuration file

        sudo grub-mkconfig -o /boot/grub/grub.cfg

Reboot computer

        reboot

The snapshots should be seen in the grub bootup menu 

 In the new desktop environment

        sudo chmod a+rx /.snapshots
        sudo chown :<USERNAME> /.snapshots

Start snappergui


