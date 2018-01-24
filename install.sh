#!/usr/bin/env sh

set +e

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "› Dotfiles:"
echo "  › Clone dotfiles"
if ! test -d ~/.dotfiles
then
  git clone git@github.com:nexeck/dotfiles.git ~/.dotfiles
else
  echo "  › Dotfiles exists"
  exit 1
fi

echo "  › Install rcm"
brew tap thoughtbot/formulae
brew install rcm

echo "  › Install dotfiles"
env RCRC=$HOME/.dotfiles/rcrc rcup

echo "› Brew bundle"
brew bundle --global

echo "› ZSH"
echo "  › Add ZSH to /etc/shells"
test -n $(command -v zsh) && ! grep -qF "$(command -v zsh)" /etc/shells && command -v zsh | sudo tee -a /etc/shells
echo "  › Switch default Shell to ZSH"
chsh -s "$(command -v zsh)"
