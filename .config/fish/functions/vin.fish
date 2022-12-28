function vin --wraps='cd ~/.config/nvim/lua/setup; nvim ../../init.lua packer.lua settings.lua mappings.lua completion.lua whichkey.lua autocmds.lua' --description 'alias vin=cd ~/.config/nvim/lua/setup; nvim ../../init.lua packer.lua settings.lua mappings.lua completion.lua whichkey.lua autocmds.lua'
  cd ~/.config/nvim/lua/setup; nvim ../../init.lua packer.lua settings.lua mappings.lua completion.lua whichkey.lua autocmds.lua $argv; 
end
