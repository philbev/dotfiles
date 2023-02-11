-- For full configuration details see:-
--      https://wezfurlong.org/wezterm/config/files.html

local wezterm = require 'wezterm'
local act = wezterm.action

return {
    default_prog = { '/usr/bin/fish'},
    font = wezterm.font('JetBrains Mono', { weight = 'Regular', italic = false }),
    --harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },  -- Disables ligatures <= >= ->
    font_size = 14.0,
    color_scheme = 'Gruvbox dark, pale (base16)',
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = true,
    force_reverse_video_cursor = false,
    window_background_opacity = 0.87,
    window_decorations = 'RESIZE',
    keys = {
    { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) },
    { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },
  },
}
