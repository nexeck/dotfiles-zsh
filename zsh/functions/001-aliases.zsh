#!/usr/bin/env zsh

diff() {
  if command -v git > /dev/null 2>&1; then
    git --no-pager diff --color=auto --no-ext-diff --no-index "$@"
  else
    command diff --unified "$@"
  fi
}