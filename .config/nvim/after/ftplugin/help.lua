-- ~/.config/nvim/after/ftplugin/help.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }

map('n', '<Space>', '<C-f>', opts)
map('n', 'b', '<C-b>', opts)
map('n', '<Esc>', '<cmd>q<cr>', opts)
map('n', '<Home>', '/|[^|]*|<cr><cmd>nohlsearch<cr>', opts)
map('n', '<Del>', '?|[^|]*|<cr><cmd>nohlsearch<cr>', opts)
map('n', '<Return>', '<C-]>', opts)
