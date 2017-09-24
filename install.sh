#!/usr/bin/env sh

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

git clone git@github.com:nexeck/dotfiles.git ~/.dotfiles
(cd ~/.dotfiles && sh ./bootstrap.sh)
