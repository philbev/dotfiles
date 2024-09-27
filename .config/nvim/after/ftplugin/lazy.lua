-- ~/.config/nvim/after/ftplugin/lazy.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }

map('n', '<Space>', '<C-f>', opts)
map('n', 'b', '<C-b>', opts)
map('n', '<Esc>', '<cmd>q<cr>', opts)
