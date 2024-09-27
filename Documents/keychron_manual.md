# KEYCHRON MANUAL
## Wired Conection
1. Connect USB cable
2. Set switch at side of keyboard to 'cable'.

## Bluetooth Connection
1. Set switch to at side of keyboard to 'Bluetooth'.
2. Press and hold Fn + 1 for 4 seconds to pair connection.
3. Keyboard will be in pairing mode for 3 minutes.
4. Set device to be connected to pairing mode.
5. For other devices use Fn + 2 Fn + 3 keys with the above procedure.
6. To switch devices use Fn + 1, Fn + 2 or Fn + 3
7. Fn + Q (long press) - activate discoverable mode

**NOTE!** Once all devices have been paired, switching on bluetooth will automatically switch to last connected device.

In bluetooth mode the keyboard will automatically switch off to save battery.

## RGB

1. Lighting Effect key - Change lighting effects
2. Fn + Right or Fn + Left - Change colour
3. Fn + F5 - Lower RGB brightness
4. Fn + F6 - Increase RGB brightness
5. Fn + Lighting Effect key - Switch RGB off
6. Fn  + + - Increase RGB speed
7. Fn  + - - Decrease RGB speed
8. Fn + Caps Lock + P (long press) - Toggles Caps lock backlight mode
9. Fn + L + Light (long press) - Locks the light effect you are using now. Repeat to unlock. Hold the fn and L key first then hold the light effect key.

## Battery

1. Fn + S + O - Toggle battery saver mode
2. Fn + S + L + R | set the auto sleep time to 10 mins
3. Fn + S + L + T | set the auto sleep time to 20 mins
4. Fn + S + L + Y | set the auto sleep time to 30 mins
5. Fn + B | battery level (RGB versions only)
    - Green indicates battery level above 70%
    - Blue indicates 30% to 70% charging level
    - Flashing indicates charging level below 30%

## Factory Reset
To factory reset keyboard:-
>   Fn + J + z

## Delete/Insert key
> Fn + I + D (long press) -  Toggles the function of the 'del' key from delete to insert. **NOTE!** In default mode Fn + del acts as insert key. Hitting the del key twice puts vim into replace mode.

## Keychron Linux Function Keys

To fix this:

Set the keyboard to Windows mode via the side switch. then use  keys:

>    Fn + X + L

(hold for 4 seconds) to set the function key row to “Function” mode. (usually
all that’s necessary on Windows)

>    echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode

Once complete, F1-F12 keys should work properly, and holding Fn turns them into
multimedia keys. Use the **evtest** utility to check how keyboard keys are
registering until the above combination of settings are configured properly.

To persist this change, add a module option for hid_apple:

>    echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf

initramfs may need to be rebuilt if hid_apple is included.

ubuntu:
>   sudo update-initramfs -u

arch:
>   mkinitcpio -P

Thanks to Mike Shade for this information:

> https://mikeshade.com/posts/keychron-linux-function-keys/?fbclid=IwAR2BEpM_nbaMgU38qqtz0QUSdVT4WmUTBby88h4QhK4qXGfhHuJ6QeqPHnc

Also thanks to Andre Bait for the following information:

> https://gist.github.com/andrebrait/961cefe730f4a2c41f57911e6195e444

Some good Linux information here.

## Dismantling/Reassembling
To remove aluminium side panels use T6H bit from bit set.
