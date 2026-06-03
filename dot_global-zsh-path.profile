typeset -gaU path

function _mayPath() {
  if [ -d "$1" ]; then
    path+="$1"
  fi
}

path=(
  "${HOME}/bin"
)

_mayPath "/home/xyzzy/.local/share/pnpm/bin"
_mayPath "/home/linuxbrew/.linuxbrew/bin"
_mayPath "/home/linuxbrew/.linuxbrew/sbin"
_mayPath "/opt/homebrew/bin"
_mayPath "/opt/homebrew/sbin"

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
_mayPath "/Library/Developer/CommandLineTools/usr/bin"

if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
