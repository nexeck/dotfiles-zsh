# _exports
export DOTFILES="$HOME/.dotfiles"
export PATH="/usr/local/sbin:$PATH"

# _load antibody
source <(antibody init)

# _load zsh plugins
antibody bundle < ~/.zsh/plugins.txt

# _source
source ~/.zsh/functions/001-aliases.zsh
source ~/.zsh/functions/002-fzf.zsh

setopt autocd

# _secret configs
[[ -e ~/.secrets ]] && source ~/.secrets

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list +'l:|=* r:|=*'

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

HISTSIZE=1000000 # max entries
SAVEHIST=1000000

setopt BANG_HIST
setopt EXTENDED_HISTORY     # save timestamp and duration
setopt INC_APPEND_HISTORY   # append entries directly
setopt SHARE_HISTORY        # share across sessions
setopt HIST_IGNORE_DUPS     # ignore duplicates
setopt HIST_IGNORE_ALL_DUPS # new entries replace old ones
setopt HIST_IGNORE_SPACE    # trim entries
setopt HIST_SAVE_NO_DUPS    # dont save duplicates
setopt HIST_VERIFY          # verify history entry before executing
# }}}

