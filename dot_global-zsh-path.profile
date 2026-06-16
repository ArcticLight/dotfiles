typeset -gaU path
typeset -gaU old_path

function _mayPath() {
  if [ -d "$1" ]; then
    path+="$1"
  fi
}

old_path=($path)
path=("${HOME}/bin")

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

path+=($old_path)

if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

