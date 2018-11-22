#!/usr/bin/env sh

set +e

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "› Update Software:"
sudo softwareupdate -i -a

echo "› Homebrew"
if ! command -v brew > /dev/null 2>&1; then
	echo "  › Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "  › Homebrew already installed"
fi

echo "› Dotfiles:"
echo "  › Clone dotfiles"
if ! test -d ~/.dotfiles
then
  git clone https://github.com/nexeck/dotfiles.git ~/.dotfiles
else
  echo "  › Dotfiles already exists"
  exit 1
fi

echo "  › Install rcm"
brew tap thoughtbot/formulae
brew install rcm

echo "  › Install dotfiles"
env RCRC=$HOME/.dotfiles/rcrc rcup

echo "› ZSH"
brew install zsh
echo "  › Add ZSH to /etc/shells"
test -n $(command -v zsh) && ! grep -qF "$(command -v zsh)" /etc/shells && command -v zsh | sudo tee -a /etc/shells
echo "  › Switch default Shell to ZSH"
chsh -s "$(command -v zsh)"

echo "› Brew bundle"
brew bundle --global
