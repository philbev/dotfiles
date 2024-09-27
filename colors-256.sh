#!/usr/bin/zsh

clear

for colour in {0..255}; do
if  [[ $(($colour % 8)) -eq 0 && $colour -ne 0 ]]; then
    printf "\n\e[38;5;${colour}m%04d \e[48;5;${colour}m \e[0m   "  $colour
else
    printf "\e[38;5;${colour}m%04d \e[48;5;${colour}m \e[0m   " $colour
fi
done

printf "\n"
