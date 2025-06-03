-- ~/.config/nvim/lua/config/options.lua

local set = vim.opt

set.termguicolors = true
set.number = true
set.relativenumber = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true
set.ignorecase = true
set.smartcase = true
set.splitbelow = true
set.splitright = true
set.laststatus = 3
set.pumheight = 8
set.timeout = true
set.timeoutlen = 1500
set.clipboard = 'unnamedplus'
set.virtualedit = 'block'
set.hlsearch = false

-------------------- GLOBAL OPTIONS --------------------
-- vim.g.gruvbox_baby_telescope_theme = 1

-------------------- DIAGNOSTICS --------------------
vim.diagnostic.config({ virtual_lines = true })
