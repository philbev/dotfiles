## Install packages

KVM is already in the kernel so no need to install.

Check if virtualisation is enabled in the motherboard's BIOS. Enable if not. Most manufacturers disable this option.

```bash
    sudo pacman -S virt-manager qemu qemu-arch-extra edk2-ovmf edk2-shell vde2 ebtables dnsmasq bridge-utils openbsd-netcat dmidecode
```
Where virt-manager, qemu and qemu-arch-extra are the basic packages for virtualisation.

Packages edk2-ovmf and edk2-shell are needed for UEFI support.

The rest of the packages vde2, ebtables, dnsmasq, bridge-utils, openbsd-netcat and dmidecode are needed for networking.

## Enable and start libvirtd service
```bash
    sudo systemctl enable libvirtd.service
    sudo systemctl start libvirtd.service
```

## Creating the bridge:

```bash
    sudo nvim br10.xml
```

Text for the bridge:

```xml
    <network>
      <name>br10</name>
      <forward mode='nat'>
        <nat>
          <port start='1024' end='65535'/>
        </nat>
      </forward>
      <bridge name='br10' stp='on' delay='0'/>
      <ip address='192.168.30.1' netmask='255.255.255.0'>
        <dhcp>
          <range start='192.168.30.50' end='192.168.30.200'/>
        </dhcp>
      </ip>
    </network>
```

## Activate the bridge:

```bash
    sudo virsh net-define  br10.xml
    sudo virsh net-start br10
    sudo virsh net-autostart br10
```
## Virt-manager
Virt-manager can be started from the start menu from within Plasma/KDE or if using a tiling window manager such as i3,
it can be launched from a terminal window with:
```bash
    virt-manager
```
Alternatively create a keyboard shortcut in **~/.config/i3/config**.

Click on 'Create a new virtual machine' icon.

### First screen (Step 1 of 5)
Select 'Local install media (ISO image or CDROM)'
Set 'Architecture' to **x86_44**
### Second screen (Step 2 of 5)
Click on 'Browse' button to select ISO image. With automatic detection selected the operating system should fill in automatically.
### Third Screen (Step 3 of 5)
Memory and CPU settings
Memory = 4096
CPUs   = 4
### Fourth Screen (Step 4 of 5)
Enable and create storage

Accept defaults.
### Fifth Screen (Step 5 of 5)
1. Change virtual machine name (optional)
2. Enable 'Customise configuration before install'
3. In 'Network selection' select 'Virtual network br 10:NAT'

### Customise configuration screen
#### Firmware:
Select BIOS to boot (UEFI or BIOS)

#### Boot options:
1. Select 'Enable boot menu'
2. Select 'SATA CDROM 1'
3. Move  'SATA CDROM 1' to top

#### Video Qxl:
Model = Virtio (select in drop down list)

## Post install

### Transparency with picom
For transparent windows **picom** needs to be installed.
```bash
    sudo pacman -S picom
```

Also edit file **/etc/xdg/picom.conf** to comment out the line:
```
    vsync = true
```
