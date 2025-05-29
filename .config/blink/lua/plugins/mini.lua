-- ~/.config/blink/lua/plugins/mini.lua

return { 
  {
    'echasnovski/mini.files',
    version = '*',
    config = function()
      require('mini.files').setup()
    end
  },
  { 'echasnovski/mini.ai',
  version = '*' ,
  config = function()
    require('mini.ai').setup()
  end
}
}
