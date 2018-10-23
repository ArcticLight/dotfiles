#!/usr/bin/zsh

# The default
EDITOR=`which vim`

if [[ $EDITOR == "*not found*" ]] ; then
    # Try nano?
    EDITOR=`which nano`
fi

if [[ $EDITOR == "*not found*" ]] ; then
    # Uh oh
    EDITOR=`which less`
fi

local usecode="no"
# If on a mac
if [[ "$(uname)" == "Darwin" ]] ; then
    usecode="yes"
# If connected to an X server
elif xhost > /dev/null 2>&1 ; then
    usecode="yes"
fi

if [[ $usecode == "yes" ]] ; then
    MAYBE_CODE=`which code`
    if [[ $MAYBE_CODE != "*not found*" ]] ; then
        EDITOR="$MAYBE_CODE -n -w"
    fi
fi

export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export EDITOR="$EDITOR"

# On ubuntu at least, there's a default package called edit which isn't even an editor...?
alias edit="$EDITOR"
