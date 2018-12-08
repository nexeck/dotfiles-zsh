#!/usr/bin/env zsh
test -d /usr/local/opt/fzf/shell || return 0

export FZF_COMPLETION_TRIGGER='**'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
