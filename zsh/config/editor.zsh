#!/usr/bin/env zsh

# Editors {{{
if command -v nvim > /dev/null 2>&1; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi
# }}}
