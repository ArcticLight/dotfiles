export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
export PATH="$HOME/bin:$PATH:$HOME/go/bin/:/snap/bin"

if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi
