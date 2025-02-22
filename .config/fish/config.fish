if status is-interactive
  # Commands to run in interactive sessions can go here
  export EDITOR=nvim
  export VISUAL=nvim
  export LESS='-erXF'
  abbr sv sudoedit
  abbr rv rm -v
  abbr vif nvim ~/.config/fish/config.fish
  abbr dot source ~/.config/fish/config.fish
  abbr vi3 nvim ~/.config/i3/config ~/.config/polybar/config.ini
  abbr viw nvim ~/.config/wezterm/wezterm.lua
  abbr vig nvim ~/.config/ghostty/config
  abbr sps sudo pacman -S
  abbr spr sudo pacman -R
  abbr spy sudo pacman -Syyu
  abbr yy yay -Syyua
  abbr gca git clone https://aur.archlinux.org/
  abbr gcg git clone https://github.com/
  abbr gcp git clone https://github.com/philbev/
  abbr ref 'sudo reflector -c GB --sort rate --age 8 -p https,http --save /etc/pacman.d/mirrorlist'
  abbr lpph 'lp -o orientation-requested=4 -o prettyprint'
  abbr lk 'lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel'
  abbr dh sudo du -xh --max-depth 1 | sort -hr
  abbr gt /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME
  # Set up fzf key bindings
  fzf --fish | source
end
