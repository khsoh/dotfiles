#!/usr/bin/env bash

## This script should be executed first on a fresh new MacBook to:
#$ 1. Install Xcode Command Line tools
## 2. Homebrew
## 3. Git pull Kok Hong's git files
## Download this script then execute on the commandline as follows:
##   source ./macos-first-install.sh

DOTFILES_GIT=git@github.com:khsoh/dotfiles.git

xcode-select --install

(brew update >/dev/null 2>&1) || (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

brew install git

pushd ~ > /dev/null

git checkout --recurse-submodules $DOTFILES_GIT && source dotfiles/bootstrap.sh

popd > /dev/null


