typeset -gaU path
path=(
  "${HOME}/bin"
)

if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
  path+="/home/linuxbrew/.linuxbrew/bin"
fi

path+=(
  "/usr/local/sbin"
  "/usr/local/bin"
  "/usr/sbin"
  "/usr/bin"
  "/sbin"
  "/bin"
  "/usr/games"
  $path
  "${HOME}/go/bin"
  "/snap/bin"
)

if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
