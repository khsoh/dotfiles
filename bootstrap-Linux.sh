#!/usr/bin/env bash

pushd "$(dirname $0)" > /dev/null

git pull --recurse-submodules origin main
git submodule update --checkout --remote --recursive

sudo apt-get install stow

# Setup the default user email to use for comment in git operations
cp /dev/null ~/.gitconfig-email

# Setup the remote URLs for fetching and pushing from and to remote URL
echo Execute ./git-remote-init.sh if you want to support pushing changes to remote repo

# Sets up the symlinks with stow
. ./dostow.sh

popd >/dev/null
