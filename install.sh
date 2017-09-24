#!/usr/bin/env sh

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo ""
echo "› Dependencies:"
if ! command -v brew > /dev/null 2>&1; then
	echo "  › Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "  › Homebrew already installed"
fi

echo "› Dotfiles:"
echo "  › Clone dotfiles"
git clone git@github.com:nexeck/dotfiles.git ~/.dotfiles
echo "  › Install rcm"
brew tap thoughtbot/formulae
brew install rcm

echo "  › Install dotfiles"
env RCRC=$HOME/.dotfiles/rcrc rcup
