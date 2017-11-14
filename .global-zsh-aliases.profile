#!/usr/bin/zsh

# Shortcuts
alias l="ls -lh"
alias ll="ls -lah"
alias clip="xclip -selection c -i"
alias e="nautilus . 2>/dev/null >/dev/null & disown ;"
alias gits="git status"
alias gitl="git log"

# Management shortcuts
alias nogood="edit \"\$HOME/.global-zsh-aliases.profile\""
alias mischeifmanaged="source \"\$HOME/.global-zsh-aliases.profile\""

# Software development conveniences
alias svd="; $HOME/bin/svd.sh ;"
alias gvd="; $HOME/bin/gvd.sh ;"
alias pat="; $HOME/bin/svd.sh ; edit patch.diff ;"
alias gpat="; $HOME/bin/gvd.sh ; edit patch.diff ;"
