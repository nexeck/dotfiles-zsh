#!/usr/bin/env zsh

gpg-connect-agent updatestartuptty /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
