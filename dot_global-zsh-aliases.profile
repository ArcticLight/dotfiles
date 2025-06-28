#!/usr/bin/zsh

# Shortcuts
if command -v zellij >/dev/null 2>&1 ; then
  alias tc="zellij a -c"
elif command -v tmux >/dev/null 2>&1 ; then
  alias tc="tmux new-session -A -s main"
fi
alias l="ls -lh"
alias ll="ls -lah"
alias k="kubectl"
alias real='cd $(pwd -P)'
alias gd="git diff -M -B -Db --ignore-blank-lines --minimal -l1000 "

