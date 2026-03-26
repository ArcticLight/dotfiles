typeset -gaU path

path=(
  "${HOME}/bin"
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
