#!/bin/bash

set -x

git config --global core.editor "vim"
touch ~/gotmydots.txt

source .bash_profile

export PATH="$(pwd -P):$PATH"

if [[ -d "/workspaces/github" ]]; then
  export IS_GH_GH=true
  cd "/workspaces/github"
  bin/setup-codespaces
fi
