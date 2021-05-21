#!/bin/sh

set -x

git config --global core.editor "vim"
touch ~/gotmydots.txt

SCRIPTSETUP="$0"

echo $SCRIPTSETUP
DOTFILESDIRREL=$(dirname $SCRIPTSETUP)
cd $DOTFILESDIRREL
DOTFILESDIR=$(pwd -P)

source $DOTFILESDIR/.bash_profile
