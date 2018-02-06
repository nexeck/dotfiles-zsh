# _exports
export DOTFILES="$HOME/.dotfiles"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$HOME/.dotfiles/zsh/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

fpath=(/usr/local/share/zsh-completions $fpath)

# _load antibody
source <(antibody init)

# _load zsh plugins
antibody bundle < ~/.zsh/plugins.txt

# _source
source ~/.zsh/functions/001-aliases.zsh
source ~/.zsh/functions/002-fzf.zsh

# _secret configs
test -e ~/.secrets && source ~/.secrets

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list +'l:|=* r:|=*'

autoload colors zsh/terminfo
colors

# Editors {{{
if command -v nvim > /dev/null 2>&1; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi
# }}}

# Directory {{{
setopt AUTO_CD           # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD        # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME     # Push to home directory when no argument is given.
setopt AUTO_NAME_DIRS    # Auto add variable-stored paths to ~ list.
setopt MULTIOS           # Write to multiple descriptors.
setopt EXTENDED_GLOB     # Use extended globbing syntax.
unsetopt CLOBBER         # Do not overwrite existing files with > and >>. Use >! and >>! to bypass.
# }}}

# Options {{{
setopt CORRECT          # correct command names
setopt ALWAYS_TO_END    # cursor moves to end of completion
setopt AUTO_LIST        # list choices
setopt AUTO_MENU        # automatically use menu
setopt AUTO_PARAM_SLASH # if completion is directory add trailing slash
setopt COMPLETE_IN_WORD # also complete in word
setopt PATH_DIRS        # path search even on command names with slashes
unsetopt CASE_GLOB      # globbing case insensitively
unsetopt MENU_COMPLETE  # always display menu, don't directly insert
# }}}

# History {{{
HISTFILE=~/.zsh_history

HISTSIZE=10000000 # max entries
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# }}}

if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t basic || tmux new -s basic; exit
  fi
fi
