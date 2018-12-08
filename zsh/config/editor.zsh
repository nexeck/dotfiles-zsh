#!/usr/bin/env zsh

# Editors {{{
if command -v nvim > /dev/null 2>&1; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi
if command -v atom > /dev/null 2>&1; then
  export VISUAL='atom'
else
  export VISUAL='vim'
fi
# }}}
