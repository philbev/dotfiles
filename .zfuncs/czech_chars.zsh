#!/usr/bin/zsh
if $(grep -q 'rcaron' /usr/share/X11/xkb/symbols/gb); then
    :
else
    sudo cp -v /usr/share/X11/xkb/symbols/gb /usr/share/X11/xkb/symbols/gb.orig
    sudo cp -v ~/gb_cz_de /usr/share/X11/xkb/symbols/gb
fi
