#!/usr/bin/env zsh

if command -v git > /dev/null 2>&1; then
  alias diff='git --no-pager diff --color=auto --no-ext-diff --no-index'
else
  alias diff='diff --unified'
fi

if command -v hub > /dev/null 2>&1; then
  eval "$(hub alias -s)"
fi

if command -v exa > /dev/null 2>&1; then
  alias ls='exa --group-directories-first'
  alias l='ls'
  alias ll='ls -l'
  alias la='ll -a'
else
  alias l='ls'
  alias ll='ls -l'
  alias la='ll -a'
fi
