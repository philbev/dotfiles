-- ~/.config/nvim/lua/config/autocmds.lua

local au = vim.api.nvim_create_autocmd

au({ 'TextYankPost' },{
  command = 'lua vim.highlight.on_yank({ timeout = 600 })'
})

au({ 'BufEnter', 'WinEnter' },{
  command = 'lua vim.opt.cursorline = true'
})

au({ 'WinLeave' },{
  command = 'lua vim.opt.cursorline = false'
})

au({ 'FileType' },{
  command = "lua vim.opt.formatoptions:remove{ 'o', 'r' }"
})
