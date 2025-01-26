local wezterm = require 'wezterm'
local act = wezterm.action

local config = {
  default_prog = { '/usr/bin/fish' },
  font = wezterm.font('JetBrainsMono NF', { weight = 'Regular', italic = false }),
  -- font = wezterm.font('Hack Nerd Font Mono', { weight = 'Regular', italic = false }),
  font_size = 15,
  -- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- == != <- >= -> <-
  window_background_opacity = 0.9,
  hide_tab_bar_if_only_one_tab = true,
  -- color_scheme = 'tokyonight_storm',
  color_scheme = 'Gruvbox dark, hard (base16)',
  keys = {
    { key = 'UpArrow',   mods = 'SHIFT', action = act.ScrollByLine(-1) },
    { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },
  }
}

return config
