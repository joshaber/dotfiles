#!/bin/bash

set -ex

# Figure out the absolute path of the dotfiles directory
DOTFILESDIRREL="$(dirname "$0")"
cd $DOTFILESDIRREL/..
DOTFILESDIR="$(pwd -P)"

for DOTFILE in .??*; do
  HOMEFILE="$HOME/$DOTFILE"
  [ -d $DOTFILE ] && DOTFILE="$DOTFILE/"
  DIRFILE="$DOTFILESDIR/$DOTFILE"

  # Don't try to install documentation/script files
  echo $DOTFILE | egrep -q '(^script/$|\.txt$|\.md$)' && continue

  if [ -L "$HOMEFILE" ] && ! [ -d "$DOTFILE" ]
  then
    # Create (and overwrite if needed) file symlinks
    ln -sfv "$DIRFILE" "$HOMEFILE"
  else
    # Create (and delete existing directory if needed) directory symlinks
    rm -rfv "$HOMEFILE" 2>/dev/null
    ln -sv "$DIRFILE" "$HOMEFILE"
  fi
done

HOMEDOTFILES="$HOME/.dotfiles"
if [ "$DOTFILESDIR" != "$HOMEDOTFILES" ]
then
  ln -sf "$DOTFILESDIR" "$HOMEDOTFILES"
fi

source $DOTFILESDIR/.bash_profile

git config --global core.editor "vim"
touch ~/gotmydots.txt

if [[ -d "/workspaces/github" ]]; then
  export IS_GH_GH=true
  cd "/workspaces/github"
  # bin/setup-codespaces
fi
