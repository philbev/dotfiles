-- ~/.config/blink/lua/configs/keymaps.lua

local map = vim.keymap.set

map('n', '<M-.>', '<cmd>bnext<cr>', {})
map('n', '<M-,>', '<cmd>bprevious<cr>', {})
map('n', '<M-c>', '<cmd>close<cr>', {})
map('n', '<M-o>', '<cmd>only<cr>', {})
map('n', '<M-n>', '<C-w>w', {})
map('n', '<M-Del>', '<cmd>bdelete<cr>', {})
map('n', '<leader>q', '<cmd>qa<cr>', {})
map('n', '<leader>w', '<cmd>wa<cr>', {})
map('n', '<leader>x', '<cmd>xa<cr>', {})
map('n', '<leader>s', '<cmd>w | so %<cr>', {})
map('n', '<leader>h', '<cmd>split<cr>', {})
map('n', '<leader>v', '<cmd>vsplit<cr>', {})
map('n', '<M-Down>', '<cmd>m +1<cr>==', {})
map('n', '<M-Up>', '<cmd>m -2<cr>==', {})

-------------------- VISUAL MODE MAPPINGS --------------------
map('v', '<M-Down>', ":m '>+1<cr>gv", {})
map('v', '<M-Up>', ":m '<-2<cr>gv", {})
