function l --wraps='exa -lghF --icons --git --group-directories-first' --description 'alias l=exa -lghF --icons --git --group-directories-first'
  exa -lghF --icons --git --group-directories-first $argv; 
end
