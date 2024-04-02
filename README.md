# Kok Hong's dotfiles

## Setting up on a fresh Mac

To setup on a fresh Mac which will not have the requisite tools, you first download this script [macos-tools-install.sh](https://github.com/khsoh/dotfiles/blob/main/macos-tools-install.sh) to your home directory.  Then source the script as follows:

```
source ~/macos-tools-install.sh
```

## Installation

Firstly, clone the repository to `~/dotfiles`

```
git clone --recurse-submodules git@github.com:khsoh/dotfiles.git ~/dotfiles
```

Next, we source the `bootstrap.sh`.  This is a shell script that was designed to run on MacOS bash - but can also be executed on Homebrew bash.  It will automatically install Homebrew and other relevant packages.

```
source ~/dotfiles/bootstrap.sh
```

Execute `git-remote-init.sh` script to setup the remote URL for the git repository.

