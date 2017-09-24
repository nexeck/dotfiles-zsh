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

echo "› Homebrew:"
echo "  › Bundle"
brew bundle

antibody/init.sh
zsh/init.sh
macos/init.sh
