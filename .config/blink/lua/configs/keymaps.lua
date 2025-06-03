-- ~/.config/blink/lua/configs/keymaps.lua

local map = vim.keymap.set

map('n', '<M-.>', '<cmd>bnext<cr>', {})
map('n', '<M-,>', '<cmd>bprevious<cr>', {})
map('n', '<M-c>', '<cmd>close<cr>', {})
map('n', '<M-o>', '<cmd>only<cr>', {})
map('n', '<M-n>', '<C-w>w', {})
map('n', '<M-Del>', '<cmd>bdelete<cr>', {})
map('n', '<leader>q', '<cmd>qa<cr>', { desc = 'quit all files' })
map('n', '<leader>w', '<cmd>wa<cr>', { desc = 'write all files' })
map('n', '<leader>x', '<cmd>xa<cr>', { desc = 'write & quit all files' })
map('n', '<leader>s', '<cmd>w | so %<cr>', { desc = 'write & source current file' })
map('n', '<leader>h', '<cmd>split<cr>', { desc = 'split window horizontal' })
map('n', '<leader>v', '<cmd>vsplit<cr>', { desc = 'split window vertical' })
map('n', '<F2>', '<cmd>nohlsearch<cr>', {})
map('n', '<F3>', '<cmd>set spell!<cr>', {})
map('n', '<F4>', '<cmd>set relativenumber!<cr>', {})
map('n', '<M-Down>', '<cmd>m +1<cr>==', {})
map('n', '<M-Up>', '<cmd>m -2<cr>==', {})
map('n', '-', '<cmd>Oil<cr>', {})
map('n', '<C-\\>', '<cmd>Neotree float toggle<cr>', {})
map('n', '<leader>m', '<cmd>lua MiniFiles.open()<cr>', {})
map('n', ']f', '<cmd>lua vim.lsp.buf.format()<cr>', {})
map('n', ']c', '<cmd>lua vim.lsp.buf.code_action()<cr>', {})

-------------------- VISUAL MODE MAPPINGS --------------------
map('v', '<M-Down>', ":m '>+1<cr>gv", {})
map('v', '<M-Up>', ":m '<-2<cr>gv", {})

-------------------- WHICH-KEY MAPPINGS --------------------
local wk = require("which-key")
wk.add({
  { "<leader>f",  group = "Fzf" },
  { "<leader>fb", "<cmd>FzfLua buffers<cr>",                                desc = "buffers",                mode = "n" },
  { "<leader>fc", "<cmd>lua FzfLua.files({ cwd = '~/.config/blink' })<cr>", desc = "Find File",              mode = "n" },
  { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>",                  desc = "diagnostics",            mode = "n" },
  { "<leader>ff", "<cmd>FzfLua files<cr>",                                  desc = "Find File",              mode = "n" },
  { "<leader>fg", "<cmd>FzfLua live_grep<cr>",                              desc = "live grep",              mode = "n" },
  { "<leader>fh", "<cmd>FzfLua help_tags<cr>",                              desc = 'help tags',              mode = "n" },
  { "<leader>fk", "<cmd>FzfLua keymaps<cr>",                                desc = 'keymaps',                mode = "n" },
  { "<leader>fl", "<cmd>FzfLua highlights<cr>",                             desc = 'highlights',             mode = "n" },
  { "<leader>fo", "<cmd>FzfLua oldfiles<cr>",                               desc = 'recent files',           mode = "n" },
  { "<leader>fr", "<cmd>FzfLua resume<cr>",                                 desc = 'resume previous search', mode = "n" },
  { "<leader>fv", "<cmd>FzfLua nvim_options<cr>",                           desc = 'vim options',            mode = "n" },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    -- { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    -- { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})
