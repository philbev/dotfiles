# INSTALLATION OF ARCH LINUX WITH BTRFS FILESYSTEM
Following boot from usb setup the environment for an easier/quicker install

```bash
	setfont ter-128b
	loadkeys uk (if not using us keyboard)

```
Edit /etc/pacman.conf to your liking

Run 

```bash
	reflector -c GB --sort rate --age 8 -p https,http --save /etc/pacman.d/mirrorlist
```

## Check internet connection
```bash
	ip -c a
	ping archlinux.org
	ping 8.8.8.8
```

## Set time
```bash
	timedatectl set-ntp true
	timedatectl status
```

## Format and Create Partitions
```bash
	fdisk /dev/<disk> OR cfdisk /dev/<disk> -- For mbr machines.
	gdisk /dev/<disk> OR cgdisk /dev/<disk> -- Foe uefi machines.
```

## Create Filesystems
```bash
For efi Partitions
	mkfs.fat -F32 /dev/<efi partition>
For root Filesystems with btrfs
	mkfs.btrfs /dev/<root partition>
```
## Mount Root Partition and Create Subvolumes
```bash
Mount root filesystem
	mount /dev/<root> /mnt

Create subvolumes
	btrfs su cr /mnt/@
	btrfs su cr /mnt/@home
	btrfs su cr /mnt/@var
	btrfs su cr /mnt/@tmp
	btrfs su cr /mnt/@.snapshots
```

## Unmount Partitions
```bash
	umount /mnt
```

## Mount Subvolumes
```bash
	mount -o noatime,commit=120,compress=zstd,space_cache=v2,subvol=@ /dev/<mountpoint> /mnt

Create folders to mount the other subvolumes
	mkdir /mnt/{boot,home,var,tmp,.snapshots}

Mount subvolumes
	mount -o noatime,commit=120,compress=zstd,space_cache=v2,subvol=@home /dev/<mountpoint> /mnt/home
	mount -o noatime,commit=120,compress=zstd,space_cache=v2,subvol=@tmp /dev/<mountpoint> /mnt/tmp
	mount -o noatime,commit=120,compress=zstd,space_cache=v2,subvol=@.snapshots /dev/<mountpoint> /mnt/.snapshots
	mount -o subvol=@var /dev/<mountpoint> /mnt/var

Mount the boot partition at /boot folder
	mount /dev/<boot mountpoint> /mnt/boot
```

## Installing the base system
```bash
For intel CPUs:
	pacstrap /mnt base linux linux-firmware gvim intel-ucode btrfs-progs bash-completion
For AMD CPUs:
	pacstrap /mnt base linux linux-firmware gvim amd-ucode btrfs-progs bash-completion
For VMs:
	pacstrap /mnt base linux linux-firmware gvim btrfs-progs bash-completion
```

## Generate fstab
```bash
	genfstab -U /mnt >> /mnt/etc/fstab

Verify fstab entries by:
	cat /mnt/etc/fstab
```
## Chroot into install
```bash
Now you must enter your Arch install to set it up:
	arch-chroot /mnt

Set timezone
	ln -sf /usr/share/zoneinfo/Region/City /etc/localtime

You can list all timezones with:
	timedatectl list-timezones

Sync hardware to system clock:
	hwclock --systohc

Set System Locale
	vim /etc/locale.gen

Generate locales:
	locale-gen

Set locale in locale.conf file:
	echo FONT=ter-128b >> /etc/locale.conf
	echo LANG=en_US.UTF-8 >> /etc/locale.conf
If you choose a different language, replace en_US.UTF-8 with your language.

Set keymap (for non-us keyboards)
	echo KEYMAP=[keymap] >> /etc/vconsole.conf
Replace [keymap] with your specific keymap.
```

## Network Configuration
```bash
Set Hostname
	echo <hostname> >> /etc/hostname
Replace <hostname> with whatever hostname you wish to set.

Edit /etc/hosts
	vim /etc/hosts
Add the following lines:
	127.0.0.1	localhost
	::1		    localhost
	127.0.1.1	<hostname>.localdomain	<hostname>
```
## Final steps in arch-chroot
```bash
Set password for root user
	passwd

Install remaining essential packages
	pacman -S grub grub-btrfs efibootmgr base-devel linux-headers networkmanager network-manager-applet wpa_supplicant dialog os-prober mtools dosfstools reflector git

Additional packages to add:
	pacman -S bluez bluez-utils cups xdg-utils xdg-user-dirs terminus-font

Add btrfs module to mkinitcpio
	vim /etc/mkinitcpio.conf
Add btrfs in MODULES=()

Recreate the image:
	mkinitcpio -p linux
Replace linux with linux-lts if you installed the lts kernel

Install GRUB (optional)
	grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id = Arch

Generate the configuration file:
	grub-mkconfig -o /boot/grub/grub.cfg

Create a User
	useradd -mG wheel <username>

Password for user:
	passwd <username>

Sudo privileges:
	EDITOR=vim visudo

Enabling services
	systemctl enable NetworkManager
	systemctl enable bluetooth
	systemctl enable org.cups.cupsd

Restart Arch

Exiting the installation
	exit

Unmount all drives
	umount -l /mnt

Reboot
	reboot
```
