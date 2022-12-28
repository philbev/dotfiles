function lpph --wraps='lp -o orientation-requested=4 -o prettyprint' --description 'alias lpph=lp -o orientation-requested=4 -o prettyprint'
  lp -o orientation-requested=4 -o prettyprint $argv; 
end
