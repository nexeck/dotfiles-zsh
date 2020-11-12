#!/usr/bin/env zsh

if test -e "/usr/libexec/java_home"; then
  local java_home=""
  java_home="$(/usr/libexec/java_home)"
  export JAVA_HOME="${java_home}"
fi
