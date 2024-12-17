-- ~/.config/nvim/lua/plugins/keymaps.lua

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
map('n', '<F2>', '<cmd>nohlsearch<cr>', {})
map('n', '<F3>', '<cmd>set spell!<cr>', {})
map('n', '<F4>', '<cmd>set relativenumber!<cr>', {})
map('n', '<M-Down>', '<cmd>m +1<cr>==', {})
map('n', '<M-Up>', '<cmd>m -2<cr>==', {})
map('n', '-', '<cmd>Oil<cr>', {})
map('n', '<C-\\>', '<cmd>Neotree float toggle<cr>', {})
map('n', '<leader>m', '<cmd>lua MiniFiles.open()<cr>', {})
map('n', ']c', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'code action' })
map('n', ']f', '<cmd>lua vim.lsp.buf.format()<cr>', { desc = 'format code' })

-------------------- VISUAL MODE MAPPINGS --------------------
map('v', '<M-Down>', ":m '>+1<cr>gv", {})
map('v', '<M-Up>', ":m '<-2<cr>gv", {})

-------------------- WHICH-KEY --------------------
local wk = require('which-key')
wk.add({
  { '<leader>c',  '<cmd>checkhealth<cr>',           desc = 'checkhealth',   mode = 'n' },
  { '<leader>l',  '<cmd>Lazy sync<cr>',             desc = 'lazy sync',     mode = 'n' },
  { '<leader>t',  '<cmd>TodoTelescope<cr>',         desc = 'todotelescope', mode = 'n' },
  { '<leader>f',  group = 'Telescope' },
  { '<leader>fb', '<cmd>Telescope buffers<cr>',     desc = 'buffers',       mode = 'n' },
  { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'diagnostics',   mode = 'n' },
  { '<leader>ff', '<cmd>Telescope find_files<cr>',  desc = 'Find File',     mode = 'n' },
  { '<leader>fg', '<cmd>Telescope live_grep<cr>',   desc = 'live grep',     mode = 'n' },
  { '<leader>fh', '<cmd>Telescope help_tags<cr>',   desc = 'help tags',     mode = 'n' },
  { '<leader>fk', '<cmd>Telescope keymaps<cr>',     desc = 'keymaps',       mode = 'n' },
  { '<leader>fl', '<cmd>Telescope highlights<cr>',  desc = 'highlights',    mode = 'n' },
  { '<leader>fr', '<cmd>Telescope oldfiles<cr>',    desc = 'recent files',  mode = 'n' },
  { '<leader>fv', '<cmd>Telescope vim_options<cr>', desc = 'vim options',   mode = 'n' },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { 'n', 'v' },                           -- NORMAL and VISUAL mode
    { '<leader>q', '<cmd>qa<cr>', desc = 'Quit' }, -- no need to specify mode since it's inherited
    { '<leader>w', '<cmd>wa<cr>', desc = 'Write' },
  }
})
