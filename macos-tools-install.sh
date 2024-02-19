#!/usr/bin/env bash

## This script should be executed on a fresh new MacBook to install the necessary tools:
#$ 1. Install Xcode Command Line tools
## 2. Homebrew
## 3. Git clone the user dotfiles
## Download this script then execute on the commandline as follows:
##   source ./macos-tools-install.sh

DOTFILES_GIT=git@github.com:khsoh/dotfiles.git

xcode-select --install

(brew update >/dev/null 2>&1) || (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

brew install git

pushd ~ > /dev/null

git clone --recurse-submodules $DOTFILES_GIT && source dotfiles/bootstrap.sh

popd > /dev/null


