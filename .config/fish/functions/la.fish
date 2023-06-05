function la --wraps='exa -laghF --icons --git --group-directories-first --color=always $argv | less' --description 'alias la=exa -laghF --icons --git --group-directories-first --color=always $argv | less -r'
  exa -laghF --icons --git --group-directories-first --color=always $argv | less -r; 
end
