#!/bin/bash
if [[ -d .git ]]; then	#Are wi in a git repository?
    MODIFIED=false
    STAGED=false
    BRANCH=$(git branch | sed -n '/^\*/s/^\* //p')
    if git status | grep -Eq 'Changes not staged for commit:|Untracked files:'; then
	MODIFIED=true
    fi
    if git status | grep -q 'Changes to be committed'; then
	STAGED=true
    fi
    if [[ $MODIFIED == "true" && $STAGED == "false" ]]; then
	export PS1="\[$bold$yellowfg\]($BRANCH)\[$bold$cyanfg\][\u:\w]\\$ \[\033[0m\]"
    fi
    if [[ $MODIFIED == "false" && $STAGED == "true" ]]; then
	export PS1="\[$bold$greenfg\]($BRANCH)\[$bold$cyanfg\][\u:\w]\\$ \[\033[0m\]"
    fi
    if [[ $MODIFIED == "true" && $STAGED == "true" ]]; then
	export PS1="\[$bold$magentafg\]($BRANCH)\[$bold$cyanfg\][\u:\w]\\$ \[\033[0m\]"
    fi
    if [[ $MODIFIED == "false" && $STAGED == "false" ]]; then
	export PS1="\[$bold$cyanfg\][\u:\w]\\$ \[\033[0m\]"
    fi
else
    export PS1="\[$bold$cyanfg\][\u:\w]\\$ \[\033[0m\]"
fi

