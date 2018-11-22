#!/usr/bin/env zsh

if command -v kubectl > /dev/null 2>&1; then
  #source <(kubectl completion zsh)
fi

if command -v gopass > /dev/null 2>&1; then
  #source <(gopass completion zsh)
fi

if command -v helm > /dev/null 2>&1; then
  #source <(helm completion zsh)
fi

if command -v awless > /dev/null 2>&1; then
  #source <(awless completion zsh)
fi
