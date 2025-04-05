-- ~/.config/nvim/lua/config/autocmds.lua

local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

ag('daffy', {
  clear = true
})

au({ 'TextYankPost' }, {
  group = 'daffy',
  command = 'lua vim.hl.on_yank({ timeout = 600 })'
})

au({ 'BufEnter', 'WinEnter' }, {
  group = 'daffy',
  command = 'lua vim.opt.cursorline = true'
})

au({ 'WinLeave' }, {
  group = 'daffy',
  command = 'lua vim.opt.cursorline = false'
})

au({ 'FileType' }, {
  group = 'daffy',
  command = "lua vim.opt.formatoptions:remove{ 'o', 'r' }"
})

au({ 'BufWrite' }, {
  group = 'daffy',
  callback = function()
    vim.lsp.buf.format()
  end
})
