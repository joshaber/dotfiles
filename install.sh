set -x

git config --global core.editor "vim"
touch ~/gotmydots.txt

SCRIPTSETUP="$0"

echo $SCRIPTSETUP
DOTFILESDIRREL=$(dirname $SCRIPTSETUP)
cd $DOTFILESDIRREL
DOTFILESDIR=$(pwd -P)

source .bash_profile
