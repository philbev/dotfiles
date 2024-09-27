Installation Tasks After Install of Arch Linux
==============================================

Systemd Services
================

Networking
----------

```
    sudo systemctl enable NetworkManager
    sudo systemctl start NetworkManager
```

Then check for connection:
```
    ip -c a
```
The **-c** option for coloured output.

or

```
    ping archlinux.org
```

Printing
--------

Install drivers and start services:

```
    sudo pacman -S cups hplip
    sudo systemctl enable org.cups.cupsd.service
    sudo systemctl start org.cups.cupsd.service
```

The printer can then be configured in three ways.
```
    1. Cups web interface (localhost:631)
    2. KDE's system settings->printers application.
    3. The hp-setup programme (installed with hplip package)
```

Solid State Disks
-----------------

Enable clean up of SSD:
```
    sudo systemctl enable fstrim.timer
    sudo systemctl start fstrim.timer
```

Pacman Mirrorlist
-----------------
If package **reflector** not installed:

```
    sudo pacman -S reflector
```

Start reflector service:
```
    systemctl enable --now reflector.service
```
The arguments passed to 'reflector' can be altered by editing file **/etc/xdg/reflector/reflector.conf** file.

The systemd timer can be used to run **reflector.service** weekly:
```
    systemctl enable --now reflector.timer
```
See https://wiki.archlinux.org/index.php/Reflector for further details.

Yay = AUR Package Installer
---------------------------
Install 'yay' using git:
```
    git clone https://aur.archlinux.org/yay-bin.git.
    cd yay-bin
    makepkg -si
```
The yay-bin directory can now be deleted as it's no longer needed.

Terminal Installation and Configuration
=======================================
Git Configuration
-----------------
```
    git init
    rm ~/.bash*
    git pull https://github.com/dotfiles.git
    source ~/.bashrc
    git remote add origin https://github.com/philbev/dotfiles.git
    git branch --set-upstream-to=origin/master

```
