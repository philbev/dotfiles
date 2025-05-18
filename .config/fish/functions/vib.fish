function vib --wraps='export NVIM_APPNAME=blink; cd ~/.config/blink; nvim **/*.lua' --description 'alias vib=export NVIM_APPNAME=blink; cd ~/.config/blink; nvim **/*.lua'
  export NVIM_APPNAME=blink; cd ~/.config/blink; nvim **/*.lua $argv
        
end
