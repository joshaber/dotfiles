#!/bin/bash

set -x

git config --global core.editor "vim"
touch ~/gotmydots.txt

source .bash_profile

if [[ $(git config --get remote.origin.url) = "https://github.com/github/github" ]]; then
  export IS_GH_GH=true
  /workspaces/github/bin/setup-codespaces
fi
