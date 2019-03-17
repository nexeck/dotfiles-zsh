#!/usr/bin/env zsh

if command -v /usr/local/opt/ruby/bin/ruby > /dev/null 2>&1; then
  export PATH="/usr/local/opt/ruby/bin:$PATH"

  export LDFLAGS="-L/usr/local/opt/ruby/lib"
  export CPPFLAGS="-I/usr/local/opt/ruby/include"
  export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
fi
