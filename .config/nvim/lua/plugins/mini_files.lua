-- ~/.config/nvim/lua/plugins/mini_files.lua

return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    require('mini.files').setup()
  end
}
