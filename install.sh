#!/bin/bash

set -x

git config --global core.editor "vim"
touch ~/gotmydots.txt

source .bash_profile

ln -s /workspaces/.codespaces/.persistedshare/dotfiles/bin /home/codespace/.local/bin

if [[ -d "/workspaces/github" ]]; then
  export IS_GH_GH=true
  cd "/workspaces/github"
  bin/setup-codespaces
fi
