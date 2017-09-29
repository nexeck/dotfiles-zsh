#!/usr/bin/env zsh

if command -v git > /dev/null 2>&1; then
  alias diff='git --no-pager diff --color=auto --no-ext-diff --no-index'
else
  alias diff='diff --unified'
fi

if command -v exa > /dev/null 2>&1; then
  alias ls='exa --group-directories-first'
  alias lla='exa -l -a --group-directories-first'
else
  alias lla='ls -al'
fi