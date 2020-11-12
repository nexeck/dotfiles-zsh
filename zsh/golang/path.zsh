#!/usr/bin/env zsh

if command -v go > /dev/null 2>&1; then
  local goPath=""
  goPath="$(go env GOPATH)/bin"
  if [[ ! "$PATH" == *${goPath}* ]]; then
    export PATH="$PATH:${goPath}"
  fi
fi
