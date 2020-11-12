# _exports
export DOTFILES="$HOME/.dotfiles"

# all of our zsh files
typeset -U config_files
config_files=(${DOTFILES}/zsh/*/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}; do
  source "${file}"
done

# _load antibody
source <(antibody init)

# _load zsh plugins
antibody bundle < ${DOTFILES}/zsh/plugins.txt

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
  source "${file}"
done

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do
  source "${file}"
done

unset config_files updated_at

# _secret configs
test -e ~/.secrets && source ~/.secrets

# _local zshrc
test -e ~/.zshrc.local && source ~/.zshrc.local
