#!/usr/bin/env zsh

if command -v cargo > /dev/null 2>&1; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi
