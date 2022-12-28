function vi3 --wraps='vi .config/i3/config .config/polybar/config.ini .config/polybar/launch.sh' --wraps='nvim ~/.config/i3/config ~/.config/polybar/config.ini ~/.config/polybar/launch.sh' --description 'alias vi3=nvim ~/.config/i3/config ~/.config/polybar/config.ini ~/.config/polybar/launch.sh'
  nvim ~/.config/i3/config ~/.config/polybar/config.ini ~/.config/polybar/launch.sh $argv; 
end
