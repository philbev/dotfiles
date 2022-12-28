#!/usr/bin/zsh
#
# configs.sh: Author Phil Bevan <phil@philbev.co.uk>
# A small zsh script to display, select and edit my configuration files using
# rofi in dmenu mode.

CONFIGEDITOR=/usr/bin/nvim

declare -A app
app=(
    bash "$HOME/.bashrc"
    zsh "$HOME/.zshrc"
    vim "$HOME/.vimrc"
    alacritty "$HOME/.config/alacritty/alacritty.yml"
    neovim "$HOME/.config/nvim/init.vim"
    "i3 window manager" "$HOME/.config/i3/config"
    "polybar" "$HOME/.config/polybar/config.ini"
    "polybar launcher" "$HOME/.config/polybar/launch.sh"
    minesweeper "$HOME/.config/kminesrc"
    wezterm "$HOME/.config/wezterm/wezterm.lua"
)

choice=$(printf '%s\n' ${(k)app} | rofi -dmenu -p "CONFIGURATION FILE TO EDIT")

# If nothing selected (Escape key pressed)
if [[ ! $choice ]]; then
    exit
fi

wezterm start $CONFIGEDITOR $app[$choice]
