#!/usr/bin/env zsh
test -d /usr/local/opt/fzf/shell || return 0

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi
