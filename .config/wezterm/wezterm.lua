-- For full configuration details see:-
--      https://wezfurlong.org/wezterm/config/files.html

local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

    config.default_prog = { '/usr/bin/fish'}
    config.font = wezterm.font('JetBrains Mono', { weight = 'Regular', italic = false })
    -- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }  -- Disables ligatures <= >= ->
    config.font_size = 14.0
    config.color_scheme = 'Gruvbox dark, pale (base16)'
    config.hide_tab_bar_if_only_one_tab = true
    config.use_fancy_tab_bar = true
    config.force_reverse_video_cursor = false
    config.window_background_opacity = 0.87
    config.window_decorations = 'RESIZE'
    config.keys = {
    { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) },
    { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) }
  }

return config
