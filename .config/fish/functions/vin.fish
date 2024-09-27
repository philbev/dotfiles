function vin --wraps='cd ~/.config/nvim; nvim init.lua **/*.lua' --wraps='cd ~/.config/nvim; nvim **/*.lua' --description 'alias vin=cd ~/.config/nvim; nvim **/*.lua'
  cd ~/.config/nvim; nvim **/*.lua $argv
        
end
