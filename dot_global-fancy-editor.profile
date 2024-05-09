#!/usr/bin/zsh

# The default
EDITOR=`which hx`

if [[ $EDITOR == "*not found*" ]] ; then
    # Try vim?
    EDITOR=`which vim`
fi

if [[ $EDITOR == "*not found*" ]] ; then
    # Try nano?
    EDITOR=`which nano`
fi

if [[ $EDITOR == "*not found*" ]] ; then
    # Uh oh
    EDITOR=`which less`
fi

export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export EDITOR="$EDITOR"

# On ubuntu at least, there's a default package called edit which isn't even an editor...?
alias edit="$EDITOR"
