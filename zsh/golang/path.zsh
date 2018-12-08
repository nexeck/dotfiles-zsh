#!/usr/bin/env zsh

if command -v go > /dev/null 2>&1; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi
