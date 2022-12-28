# Installation of Arch Linux with Plasma and/or Gnome

## Pre-installation

Download the iso from <https://www.archlinux.org/download/>

Verify the signature:

```bash
    gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```

Alternatively, from an existing Arch Linux installation run:

```bash
    pacman-key -v archlinux-version-x86_64.iso.sig
```

### Write to USB

Insert USB drive and discover the device with:

```bash
    lsblk
```

Write to USB drive

```bash
    dd if=archlinux<version>x86_64.iso of=/dev/sdX bs=4M status=progress && sync
```

Where /dev/sdX was obtained from the 'lsblk' command above.

## Boot the Live Environment
Insert the USB stick and boot until archroot prompt is displayed.

## Keyboard Layout
For non US keyboards the configuration needs changing:

```bash
    loadkeys uk
```

Works for UK PC keyboards.

To obtain a list of all keyboard layouts:

```bash
    ls /usr/share/kbd/keymaps/**/*.map.gz
```

If the font is not suitable then 'setfont' can be used:

```bash
    setfont /usr/share/kbd/consolefonts/iso01-12x22.psfu.gz
```

## EFI install
For uefi installation need to check for efi:
```bash
    ls /sys/firmware/efi/efivars
```
The directory should not be empty.

## GPM (General Purpose Mouse)
Install gpm:
```bash
    pacman -Sy gpm
```
Enable and start with systemctl:
```
    sudo systemctl enable gpm.service
    sudo systemctl start gpm.service
```

## Internet
### Wired Connection
Check for connection with:

```bash
    ip -c a
    ping - c5 archlinux.org
```

### Wireless Connection
#### Blocked Wifi
Many laptops have a hardware button (or switch) to turn off wireless card, however, the card can also be blocked by kernel. This can be handled by rfkill. To show the current status:

```bash
    rfkill list
```
Should output something like this:
```
0: phy0: Wireless LAN
    Soft blocked: yes
    Hard blocked: yes
```
If the card is hard-blocked, use the hardware button (switch) to unblock it. If the card is not hard-blocked but soft-blocked, use the following command:

```
    rfkill unblock wifi
```
#### Connecting with iwctl
Start the iwctl program:
```bash
    iwctl
```
First, if you do not know your wireless device name, list all Wi-Fi devices:

```bash
[iwd]# device list
```

Then, to scan for networks:
```bash
[iwd]# station device scan
```
You can then list all available networks:
```bash
[iwd]# station device get-networks
```
Finally, to connect to a network:
```bash
[iwd]# station device connect SSID
```
If a passphrase is required, you will be prompted to enter it. Alternatively, you can supply as a command line argument:
```bash
$ iwctl --passphrase passphrase station device connect SSID
```

##### Tip:
In the iwctl prompt you can auto-complete commands and device names by hitting Tab.

To exit the interactive prompt, send EOF by pressing Ctrl+d.

You can use all commands as command line arguments without entering an interactive prompt. For example: iwctl device wlp3s0 show.

## Time

```bash
    timedatectl set-ntp true
```

Check the service status:

```bash
    timedatectl status
```


## Disks

Check partitions with:

```bash
    lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel
```

or

```bash
    lsblk -o +fstype,label
```

Create partitions with 'fdisk', 'gdisk', 'cfdisk' or 'cgdisk'.

### Format partitions

EFI partition

NOTE!!! Not to be performed if efi partition exists. All data will be lost.

```bash
    mkfs.fat -F32 /dev/sdX
```

Root partition:

```bash
    mkfs.ext4 /dev/sdY
```

Home and /usr/local partitions:

Only format these partitions as ext4 if they are being newly created. Do not
format if using existing partitions

### Mount partitions

**Root partition:**

```bash
    mount /dev/sdX /mnt
```

**Home partition:**

```bash
    mkdir /mnt/home
```

```bash
    mount /dev/sdX /mnt/home
```

**/usr/local partition:**


Do not mount rhe **/usr/local** directory yet  as this interferes with pacman
install later on.
```bash
    mount /dev/sdX /mnt/usr/local
```

**EFI partition:**

```bash
    mkdir -p /mnt/boot/efi

```

```bash
    mount /dev/sdX /mnt/boot/efi
```

## Install Base System

### 1. Utilising reflector package

Download and install package **reflector**.
```
    pacman -Sy reflector
    pacman -Syyy
    reflector -c GB --sort rate -a 6 --save /etc/pacman.d/mirrorlist
```
OR

### 2. Manually edit pacman configuration file
Edit the **/etc/pacman.d/mirrorlist** file with nvim and move United Kingdom servers
to the top ensuring 'neovim' has been installed first.

```bash
    pacman -S neovim
    nvim /etc/pacman.d/mirrorlist
```

Install basic software with:

```bash
    pacstrap /mnt base linux linux-firmware intel-ucode gvim neovim bash-completion
```

```bash
    mkdir -p /mnt/usr/local

```
## Fstab

Generate the **/etc/fstab** file:

```bash
    genfstab -U /mnt >> /mnt/etc/fstab
```

Check for correctness:

```bash
    cat /mnt/etc/fstab
```

## Arch-root

Log into the newly created system with:

```bash
    arch-chroot /mnt
```

## Swap

### Swapfile
Use dd to create a swap file the size of your choosing. For example, creating a 2 GiB swap file:

```bash
    dd if=/dev/zero of=/swapfile bs=1M count=2000 status=progress
```
Note: Using dd to allocate a swap file is the most portable solution, see swapon(8) § Files with holes for details.

Set the right permissions (a world-readable swap file is a huge local vulnerability):

```bash
    chmod 600 /swapfile
```
After creating the correctly sized file, format it to swap:
```bash
    mkswap /swapfile
```
Activate the swap file:
```bash
    swapon /swapfile
```
Finally, edit the fstab configuration to add an entry for the swap file:

/etc/fstab
```
/swapfile none swap defaults 0 0
```
For additional information, see fstab#Usage.

Note: The swap file must be specified by its location on the file system not by its UUID or LABEL.
Remove swap file
#### Swapfile removal
To remove a swap file, it must be turned off first and then can be removed:
```bash
    swapoff /swapfile
    rm -f /swapfile
```
Finally remove the relevant entry from **/etc/fstab**.

### Swap partition
To set up a partition as Linux swap area, the mkswap command is used. For example:
```bash
    mkswap /dev/sdxy
```
Warning: All data on the specified partition will be lost.
To enable the device for paging:
```bash
    swapon /dev/sdxy
```
To enable this swap partition on boot, add an entry to **/etc/fstab**:
```
UUID=device_UUID none swap defaults 0 0
```
where the device_UUID is the UUID of the swap space.
## Time

Set timezone:

```bash
    ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
```

Synchronise system and hardware clocks:

```bash
    hwclock --systohc --localtime
```

## Localisation

Edit **/etc/locale.gen**

```bash
    nvim /etc/locale.gen
```
Search for en_GB and uncomment the lines that contain it.

Generate locale:

```bash
    locale-gen
```

Create new file **/etc/locale.conf**

```bash
    nvim /etc/locale.conf
```
Insert line

```bash
LANG=en_GB.UTF-8
```
If you set the keyboard layout, make the changes persistent:

Create new file **/etc/vconsole.conf**:
```
    nvim /etc/vconsole.conf
```
Insert line:
```
KEYMAP=uk
```
## Internet

### Hostname

Edit **/etc/hostname**

```bash
    nvim /etc/hostname
```

Insert \<hostname> of your choice.


### Hosts

Edit **/etc/hosts**

```bash
    nvim /etc/hosts
```

Enter the following lines into the file:

```
    127.0.0.1   localhost
    ::1     localhost
    127.0.1.1   <hostname>.localdomain  <hostname>
```

## Root password

Create root password

```bash
    passwd
```

## Grub

### Packages
Install the following packages:

```bash
    pacman -S grub efibootmgr networkmanager network-manager-applet \
    wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base devel \
    linux-headers git zsh pacman-contrib zsh-completions
```

Note! wireless_tools and wpa_supplicant are only needed for machines with wi-fi.

### Grub install

```bash
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=<boot-loader name>
```

### Grub Configuration

```bash
    grub-mkconfig -o /boot/grub/grub.cfg
```

## Exit Installation and unmount

Return to Arch boot disk

```bash
    exit
```

Unmount new partitions

```bash
    umount -R /mnt
```

or

```bash
    umount -a
```

Will get error messages with second method.

Reboot

```bash
    reboot
```

## New Installation

When rebooted into the new install

## Internet

### Start Networkmanager

Wired connection

```bash
    systemctl start NetworkManager

```

```bash
    systemctl enable NetworkManager
```

NOTE! Uppercase 'N' and 'M' in NetworkManager.

Wireless connection

```bash
    nmtui
```

### Check Internet Connection

```bash
    ip a
```

## Create User Accounts

Create New User

```bash
    useradd -m -g users -G wheel <username>
    passwd <username>
```

## Sudo
Sudo has now to be configured.

```bash
    EDITOR=nvim visudo
```

Edit accordingly.

## Graphics

```bash
    pacman -S xf86-video-amdgpu
```
Or if installing on a virtual machine with kvm:
```bash
    pacman -S xf86-video-qxl
```

```bash
    pacman -S xorg xorg-xinit
```
The **xorg-xinit** package is only need if a display manager isn't going to be installed.

## Desktop Environments


### Plasma

```bash
    pacman -S sddm
```

```bash
    systemctl enable sddm
```

Install Plasma and applications

```bash
    pacman -S plasma kde-applications xdg-user-dirs packagekit-qt5
```

### Gnome [optional]

Install and enable desktop manager gdm

```bash
    pacman -S gdm

```

```bash
    systemctl enable gdm
```

Install gnome desktop environment

```bash
    pacman -S gnome gnome-extra
```




[NOTE](NOTE)! For gnome desktop install 'gnome' and 'gnome-extra' packages.

