-- ~/.config/blink/lua/configs/options.lua

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
set.timeoutlen = 1200
set.clipboard = 'unnamedplus'
set.virtualedit = 'block'
set.winborder = 'rounded'
set.hlsearch = false

vim.diagnostic.config({ virtual_lines = true })
