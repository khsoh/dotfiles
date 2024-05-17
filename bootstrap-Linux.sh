#!/usr/bin/env bash

SCRIPTNAME=$(readlink -f ${BASH_SOURCE[0]})
pushd "$(dirname $SCRIPTNAME)" > /dev/null

git pull --recurse-submodules origin main
git submodule update --checkout --remote --recursive

sudo apt-get install stow

# Setup the default user email to use for comment in git operations
./setup-gitemail.sh

# Setup the remote URLs for fetching and pushing from and to remote URL
./git-remote-init.sh

# Sets up the symlinks with stow
. ./dostow.sh

popd >/dev/null
