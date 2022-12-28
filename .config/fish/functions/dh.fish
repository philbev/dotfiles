function dh --wraps='sudo du -xh --max-depth 1 $argv | sort -hr' --description 'alias dh=sudo du -xh --max-depth 1 $argv | sort -hr'
  sudo du -xh --max-depth 1 $argv | sort -hr; 
end
