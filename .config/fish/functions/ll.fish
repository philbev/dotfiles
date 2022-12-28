function ll --wraps=ls --wraps='exa -lghF --icons --git --group-directories-first $argv | less' --wraps='exa -lghF --icons --git --group-directories-first --color=aways $argv | less' --wraps='exa -lghF --icons --git --group-directories-first --color=always $argv | less' --wraps='exa -laghF --icons --git --group-directories-first --color=always $argv | less' --description 'alias ll=exa -lghF --icons --git --group-directories-first --color=always $argv | less'
  exa -lghF --icons --git --group-directories-first --color=always $argv | less; 
end
