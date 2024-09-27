#!/usr/bin/bash
# MY /home/.bashrc INITIALISATION FILE

#if [[ $TERM = "linux" ]]; then
#    setfont /usr/share/kbd/consolefonts/iso01-12x22.psfu.gz
#fi

## SOURCED FILES
# Load all my functions from $HOME/.functions.sh
if [[ -f $HOME/.functions.sh ]]; then
    source "$HOME"/.functions.sh
fi

if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# Give some colour to man pages.
if [[ -f ~/.less_colours.sh     ]]; then
        source "$HOME"/.less_colours.sh
fi

# Define some variables to be used for colours
if [[ -f ~/.colors      ]]; then
        source "$HOME"/.colors
fi


## ENVIRONMENT VARIABLES
if [[ $USER != root ]]; then
    export LS_OPTIONS=${LS_OPTIONS/auto/always}
fi
export PATH=$PATH:/usr/local/bin/android-studio/bin:/usr/local/bin/android-sdk-linux/platform-tools     # Needed for Android SDK
export LANG="en_GB.UTF-8"

export SHELLCHECK_OPTS="-e SC1090 -e SC2154 -e SC2012"
export LESS="-eFRX"
export HISTCONTROL=ignoredups:ignorespace:erasedups
export HISTTIMEFORMAT="%c: "
export QUEUEDIR=/home/philbev/.sbopkg/queues    # Needed for Sbopkg
export HISTFILESIZE=50000
export HISTSIZE=1000
export HISTIGNORE=l:ll:lm:c:a:h:la:lh
export REPOS=/usr/local/downloads/repositories
export GREP_COLORS='ms=01;38;5;196:fn=01;38;5;201:ln=01;38;5;46'
export GVFS_DISABLE_FUSE=1
export CXXFLAGS='-std=c++14 -g -Wall'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export SLACK_DIR=/usr/local/downloads/repositories/slackware64/latest
export EDITOR=nvim
export PYTHONPATH=${PYTHONPATH}:${HOME}/src/python/modules
shopt -s histappend
shopt -s checkwinsize   #Hopefully this will stop bash from messing up my screen occasionally.

## ALIASES
alias ..="cd .."
alias a=alias
alias cda='cd /usr/local/audio/mp3'
alias cdd='cd /usr/local/docs'
alias cdp='cd /usr/local/pictures'
alias cdr='cd /usr/local/downloads/repositories'
alias cdv='cd /usr/local/videos'
alias cdw='cd /usr/local/downloads'
alias dot='. $HOME/.bash_profile'
alias dot='. $HOME/.bashrc'
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
alias lh='ls -lhF --color --group-directories-first'
alias lph='lp -o orientation-requested=4'
alias lpp='lp -o prettyprint'
alias lpph='lp -o orientation-requested=4 -o prettyprint'
alias lsblk='lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel'
alias rv='rm -v'
alias startx='startx -- -nolisten tcp'
alias v=nvim
alias vi=nvim
alias vib='vi $HOME/.bashrc'
alias vie='vi $HOME/.emacs'
alias vii='nvim $HOME/.config/nvim/init.vim'
alias vil='vi $HOME/.bash_logout'
alias vim='TERM=xterm-256color vim'
alias vin='nvim $HOME/.config/nvim/init.vim'
alias vip='vi $HOME/.bash_profile'
alias viv='vim $HOME/.vimrc'
alias vm='vifmrun'

## FUNCTIONS
### cd ()
# Need to source ~/.bashrc every time a directory is changed so as to get the status of git.
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && . "$HOME"/.bashrc
}

### dh ()
dh () {
    du "$@" -d 1 -xh | sort -rh
}

### rsync-slack64 ()
rsync-slack64 () {
    repo=/usr/local/downloads/repositories/slackware64
    wget -q -P /tmp http://ftp.slackware.uk/slackware/slackware64-current/ChangeLog.txt
    if diff /tmp/ChangeLog.txt $repo/latest/ChangeLog.txt >/dev/null; then
        rm -v /tmp/ChangeLog.txt
        echo -e "\033[1;35m"NO CHANGES! Nothing to download"\033[0m"
    else
        rm -v /tmp/ChangeLog.txt
            rsync -avh --delete --progress /$repo/latest/ $repo/previous
            rsync -avh --delete --progress --exclude=source rsync://rsync.slackware.uk/slackware/slackware64-current/ $repo/latest
    fi
}

### rsync-italian ()
rsync-italian () {
    rsync -avh --progress --delete  /usr/local/docs/italian/ /home/philbev/Dropbox/italian
}

### rsync-german ()
rsync-german () {
    rsync -avh --progress --delete /usr/local/docs/german/ /home/philbev/Dropbox/german
}

### g ()
g () {
        g++ -o "${1%.cpp}" "$@"
}

### gh ()
gh () {
    if [[ $# != 1 ]]; then
        echo "grep for <search-item> in history:-"
        echo "Usage: gh <search-item>"
    fi
    history | grep "$@" 2>/dev/null
}

### l ()
l () {
    exa -lgh --icons --git --color=always --group-directories-first "$@" | less
}

### la ()
la () {
    exa -algh --color=always --icons --git  --group-directories-first  "$@" | less
}

### ll ()
ll () {

    ls -AlF --color=auto  --group-directories-first "$@" | less
}

### lm ()
lm () {

        ls -AlF --color=auto  --group-directories-first "$@" | more
}

### inf ()
inf () {
        info coreutils "$@" "invocation"
}

### mydate ()
mydate () {
    date
}

[ -f ~/.fzf.bash ] && source "$HOME"/.fzf.bash

alias luamake=/home/phil/lua-language-server/3rd/luamake/luamake

eval "$(starship init bash)"

