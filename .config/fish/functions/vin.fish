function vin --wraps='cd ~/.config/nvim; nvim init.lua **/*.lua' --wraps='cd ~/.config/nvim; nvim **/*.lua' --wraps='export NVIM_APPNAME=nvim; cd ~/.config/nvim; nvim **/*.lua' --description 'alias vin=export NVIM_APPNAME=nvim; cd ~/.config/nvim; nvim **/*.lua'
  export NVIM_APPNAME=nvim; cd ~/.config/nvim; nvim **/*.lua $argv
        
end
