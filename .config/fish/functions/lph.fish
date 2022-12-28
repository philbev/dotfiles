function lph --wraps='lp -o orientation-requested=4' --description 'alias lph=lp -o orientation-requested=4'
  lp -o orientation-requested=4 $argv; 
end
