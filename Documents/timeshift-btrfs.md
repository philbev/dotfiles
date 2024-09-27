Install grub-btrfs:
    sudo pacman -S grub-btrfs
    sudo grub-mkconfig -o /boot/grub/grub.cfg

grub-btrfs can be configured in /etc/default/grub-btrfs/config

Reboot at this time shows no snapshots.

Install timeshift:
    yay -S timeshift-autosnap
The timeshift-autosnap package will install timeshift as a dependency.

Reboot reveals again no snapshots.

Launch timeshift and run through wizard (should need no changes).

Create new snapshot from within timeshift.

Reboot again shows no snapshot.

Configure launching service:
    Launch timeshift (has to be running)
    sudo systemctl enable --now grub-btrfs.path
Check installed correctly:
    systemctl status grub-btrfs.path
    systemctl -t mount

Install a package (for testing purposes)
    sudo pacman -S libreoffice

Launch timeshift and create new snapshot.

Reboot should reveal snapshot menu option at grub prompt.
    Select snapshots option then linux kernel.

Following reboot launch timeshift as soon as possible and restore selected snapshot.

Reboot for newly restored snapshot to be effective.
Note! There will be no snapshots on grub menu.

Resync timeshift:
    Launch timeshift
    Create snapshot

Reboot should now reveal snapshots in grub menu.
