#!/usr/bin/zsh
# ~/.zshrc: Configuration file for zsh.
# Lines beginning with a single '#' are comments as usual.
# Lines beginning with a '##' are level 1 folds.
# Lines beginning with a '###' are level 2 folds etc.
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ $TERM != 'linux' ]]; then
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
fi

## LINES CONFIGURED BY ZSH-NEWUSER-INSTALL
HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=15000
setopt incappendhistory autocd extendedglob
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install



# The following lines were added by compinstall
zstyle :compinstall filename '/home/phil/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit
#prompt fire red magenta blue white white

# End of lines added by compinstall
## KEY BINDINGS
bindkey -v
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "       " expand-or-complete-prefix     # <Tab> key
bindkey "\e[B" down-line-or-beginning-search
bindkey "\eh" run-help
bindkey '\eq' push-line-or-edit
bindkey "\e." insert-last-word
bindkey -M vicmd "^R" fzf-history-widget
bindkey "[3~" delete-char             # <Del> key
bindkey "[F" end-of-line              # <End> key
bindkey "[H" beginning-of-line        # <Home> key
bindkey "" history-incremental-search-backward
bindkey -s '`' '$()\ei'
if [[ -f /etc/arch-release ]]; then     # pacman not in Slackware.
    bindkey -s "p" "sudo pacman --color=auto -S"   # <Alt-p>
fi

# To insert an unicode character in the command line use the key
# sequence ^Xi<unicode hex number>^xi:
#   ^xif0f9^xi prints first aid wagon :-)
# To print unicode character with echo:
#       echo "\uf0f9"
autoload insert-unicode-char
zle -N insert-unicode-char
bindkey '^Xi' insert-unicode-char

## OPTIONS

if [[ $TERM = linux ]]; then
    setfont /usr/share/kbd/consolefonts/iso01-12x22.psfu
fi
setopt nobeep
setopt nocaseglob               # Case insensitive globbing
setopt nocheckjobs              # Don't warn about running processes when exiting
setopt correct                  # Correct mistakes
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups     # If new command is a duplicate, remove the older one.
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_beep
# Autopushd options
setopt autopushd
setopt numericglobsort          # Sort filenames numerically when it makes sense
setopt pushdsilent
setopt pushdminus
setopt pushdignoredups
setopt rcexpandparam            # Array expension with parameters

## VARIABLES (PARAMETERS)

fpath=( ~/.zfuncs "${fpath[@]}" )
path=(~/.gem/ruby/2.7.0/bin ~/.gem/ruby/2.7.2/bin ~/.local/bin "${path[@]}")
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LANG=en_GB.UTF-8
export EDITOR=/usr/bin/nvim
export SHELLCHECK_OPTS="-e SC1090 -e SC2154 -e SC2012"
# Less colours. Needs 'source-highlight' package to be installed.
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS="-eFRX"
export GREP_COLORS='ms=01;38;5;196:fn=01;38;5;201:ln=01;38;5;46'
export HELPDIR=/usr/share/zsh/$ZSH_VERSION/help
export DIRSTACKSIZE=20          # Needed for autopushd.
export PATH=$PATH:/home/phil/.local/share/nvim/lsp_servers/ltex/ltex-ls/bin
export PYTHONPATH=${PYTHONPATH}:${HOME}/src/python/modules
export FZF_DEFAULT_COMMAND="fd -H -I"
export FZF_DEFAULT_OPTS='--color light,hl:196,hl+:21,fg+:235,bg+:136,fg+:254
--color info:46,prompt:37,spinner:108,pointer:196,marker:21 --multi'

## ALIASES

alias ..="cd .."
alias a=alias
alias cda='cd /usr/local/audio/mp3'
alias cdd='cd /usr/local/docs'
alias cdp='cd /usr/local/pictures'
alias cdr='cd /usr/local/downloads/repositories'
alias cdv='cd /usr/local/videos'
alias cdw='cd /usr/local/downloads'
alias dv='dirs -v'
alias dot='. $HOME/.zshrc'
alias ej0='eject -T /dev/sr0'
alias ej1='eject -T /dev/sr1'
alias ej='eject -T /dev/sr0'
alias em='emacs -nw'
alias emkeys='cat /usr/local/docs/myinfo/emacs-editing-commands.txt'
alias f.='find . -name'
alias f='find / -name'
alias gitl='git log --decorate --oneline --graph'
alias grep='grep --color=auto --directories=skip'
alias ifc='/sbin/ifconfig'
alias ip='ip -c'
alias lc='colorls --gs -l --sd'
alias lh='lsd -lhF --color=always --group-dirs=first --icon=always | less'
alias lph='lp -o orientation-requested=4'
alias lpp='lp -o prettyprint'
alias lpph='lp -o orientation-requested=4 -o prettyprint'
alias ls='lsd --color=always --group-dirs first'
alias lk='lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel'
alias rv='rm -v'
alias sp='sudo pacman -S'
alias sps='sudo pacman -Ss'
alias svi='sudo nvim'
alias startx='startx -- -nolisten tcp'
alias v=nvim
alias vi=nvim
alias v3='nvim ~/.config/i3/config'
alias va='nvim ~/.config/alacritty/alacritty.yml'
alias vim='TERM=xterm-256color vim'
alias vib='vi $HOME/.bashrc'
alias vie='vi $HOME/.emacs.d/init.el'
alias vii='nvim $HOME/.config/nvim/init.vim'
alias vil='vi $HOME/.zlogout'
alias vip='vi $HOME/.zprofile'
alias vin='cd ~/.config/nvim;nvim init.lua lua/user/packer.lua lua/user/mappings.lua lua/user/lspconfig.lua'
alias viv='vim $HOME/.vimrc'
alias viz='nvim $HOME/.zshrc'
alias vm='vifmrun'
alias -s md=nvim
alias -s pdf=okular
alias -s tex=nvim
alias -s txt=nvim

## PROMPTING


# Show vim status when in vi mode.
# Incompatible with cursor styles for insert and command modes below,
# so commented out temporarily. Maybe deleted in the future.
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/** %SNORMAL%s **}/(main|viins)/** INSERT **}"
#    RPS2=$RPS1
#    zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select

### Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.+

prompt="%B%F{226}(${BRANCH})%F{196}[%F{51}%n%F{196}:%F{201}%2~%F{196}]%f%b%% "



## FUNCTIONS

source ~/.colors
autoload -Uz fuzzy_funcs        # fzf functions defined here.
fuzzy_funcs
autoload precmd
precmd
# This sets the $LS_COLORS variable. For arch linux ~/.dir_colors does
# not exist so must be generated with "eval $(dircolors -b ~/.dir_colors)"
eval $(dircolors ~/.dir_colors)
zstyle ':completion:*' menu select                              # For autocompletion with an arrow-key driven interface.
setopt COMPLETE_ALIASES                                         # For autocompletion of command line switches for aliases.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'          # For case insensitive auto completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find newly installed executables in path.
zstyle ':completion:*' accept-exact '*(N)'                      # Speed up completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

autoload -Uz gitx
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-sudo
unalias 'run-help' 2>/dev/null
alias help=run-help
### Select bracketed
# Text object for matching characters between matching pairs of brackets
# So for example, given (( i+1 )), the vi command ci( will change
# all the text between matching colons.
# The following is an example of how to enable this:
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

### select-quoted
# Text object for matching characters between a particular delimiter
#
# So for example, given "text", the vi command vi" will select
# all the text between the double quotes
#
# The following is an example of how to enable this:
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done

autoload czech_chars.zsh
czech_chars.zsh

### man()
# Colourisation of man pages.
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[38;2;0;255;0m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

### dh()
dh () {
    du "$@" -d 1 -xh | sort -rh
}

### rsync-italian()
rsync-italian () {
    rsync -avh --progress --delete  /usr/local/docs/italian/ /home/philbev/Dropbox/italian
}

### rsync-german()
rsync-german () {
    rsync -avh --progress --delete /usr/local/docs/german/ /home/philbev/Dropbox/german
}

### g()
g () {
    g++ -o ${1%.cpp} "$@"
}

### gh()
gh () {
    if [[ $# != 1 ]]; then
        echo "grep for <search-item> in history:-"
        echo "Usage: gh <search-item>"
    fi
    history | grep "$@" 2>/dev/null
}


### l()
l () {
    lsd -lhF --color=always --group-dirs=first --icon=always "$@" | less
}

### la()
la () {
    lsd -AlvhF --color=always --group-dirs=first --icon=always  "$@" | less
}

### ll()
ll () {

    lsd -lhF --color=always --group-dirs=first --icon=always "$@" | less
}

### lm()
lm () {

    lsd -lhF --color=always --group-dirs=first --icon=always "$@" | more
}

### inf()
inf () {
    info coreutils "$@" "invocation"
}

# This needs to be at the end of the file as something else is overwriting it.
# Powerlevel9k seems to be the main culprit.
export LC_CTYPE=en_GB.UTF-8


#if [[ $TERM != 'linux' ]]; then
#    neofetch
#else
#    prompt='>>> '
#fi

## PLUGINS

### FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Zsh-z Plugin
if [[ -f ~/zsh-z/zsh-z.plugin.zsh ]]; then
    source ~/zsh-z/zsh-z.plugin.zsh
elif [[ -f /usr/share/zsh/plugins/zsh-z/zsh-z.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-z/zsh-z.plugin.zsh
fi

### Zsh-syntax-highlighting
if [[ -f ~/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]]; then
    source ~/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
elif [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#00ff00, bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#00ffff, bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#ffff00, bold'

### Zsh-autosuggestions

if [ -f ~/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [  -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then   # For Ubuntu Linux
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [  -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then   # For Manjaro Linux
    source /usr/share/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

### Powerlevel10k Configuration.
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ $TERM != 'linux' ]]; then
    if [[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel9k.zsh-theme ]]; then
        source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    elif [[ -f ~/powerlevel10k/powerlevel10k.zsh-theme ]]; then    # For Ubuntu manual install.
        source ~/powerlevel10k/powerlevel10k.zsh-theme
    fi
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

alias luamake=/home/phil/lua-language-server/3rd/luamake/luamake
