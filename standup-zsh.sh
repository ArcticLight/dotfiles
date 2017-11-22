#!/usr/bin/env bash
STARTUP_CMD="bash -c \"export STARTUP_DIRT=$(pwd); zsh\""

if tmux list-sessions ; then
    tmux new-window "$STARTUP_CMD"
    tmux a
else
    tmux new-session -d "$STARTUP_CMD"
    tmux rename-window "term1"
    tmux new-window "$STARTUP_CMD"
    tmux rename-window "shy"
    tmux new-window "$STARTUP_CMD"
    tmux rename-window "c&c"
    tmux -2 attach-session -d
    exit -1
fi
