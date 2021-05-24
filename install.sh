#!/bin/bash

set -x

git config --global core.editor "vim"
touch ~/gotmydots.txt

OG_DIR=$(pwd -P)

SCRIPTSETUP="$0"

echo $SCRIPTSETUP
DOTFILESDIRREL=$(dirname $SCRIPTSETUP)
cd $DOTFILESDIRREL
DOTFILESDIR=$(pwd -P)

source $DOTFILESDIR/.bash_profile

if [[ $(git config --get remote.origin.url) = "https://github.com/github/github" ]]; then
  export IS_GH_GH=true
fi
