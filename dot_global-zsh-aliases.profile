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
alias gd="git diff -M -B -Db --ignore-blank-lines --minimal -l1000 -- ':!*.min.*' ':!*package-lock.json' "
alias ccz='cd $(chezmoi source-path)'
alias ccu='chezmoi update'

# change term command "open" into
# desktop-specific bin on all platforms
opener=""

if command -v "/mnt/c/Windows/explorer.exe" 2>&1 > /dev/null ; then
    opener="/mnt/c/Windows/explorer.exe"
elif command -v "nautilus" 2>&1 > /dev/null ; then
    opener="nautilus"
elif command -v "nemo" 2>&1 > /dev/null ; then
    opener="nemo"
elif command -v "/usr/bin/open" 2>&1 > /dev/null ; then
    opener="/usr/bin/open"
fi

if [ -n "${opener}" ] ; then
    alias open="$opener"
fi

