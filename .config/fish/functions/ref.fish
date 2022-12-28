function ref --wraps='sudo reflector -c GB --sort rate --age 8 -p https,http --save /etc/pacman.d/mirrorlist' --description 'alias ref=sudo reflector -c GB --sort rate --age 8 -p https,http --save /etc/pacman.d/mirrorlist'
  sudo reflector -c GB --sort rate --age 8 -p https,http --save /etc/pacman.d/mirrorlist $argv; 
end
