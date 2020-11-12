#!/usr/bin/env zsh

if [[ ! "$PATH" == */usr/local/sbin* ]]; then
  export PATH="/usr/local/sbin:${PATH}"
fi

if [[ ! "$PATH" == */usr/local/bin* ]]; then
  export PATH="/usr/local/bin:${PATH}"
fi

if [[ ! "$PATH" == *${DOTFILES}/bin* ]]; then
  export PATH="${DOTFILES}/bin:${PATH}"
fi

if [[ ! "$PATH" == *${HOME}/.bin* ]]; then
  export PATH="${HOME}/.bin:${PATH}"
fi

if [[ ! "$PATH" == *${HOME}/.zsh/bin* ]]; then
  export PATH="${HOME}/.zsh/bin:${PATH}"
fi
