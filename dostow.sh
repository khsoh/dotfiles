#!/usr/bin/env bash

SCRIPTNAME=$(readlink -f ${BASH_SOURCE[0]})
pushd "$(dirname $SCRIPTNAME)" > /dev/null

# Sets up the symlinks with stow
stow -Rt / ROOT 2> >(grep -v "BUG in find_stowed_path" 1>&2)
stow -Rt ~ HOME-common 2> >(grep -v "BUG in find_stowed_path" 1>&2)

[[ -d ./HOME-$(uname) ]] && stow -Rt ~ HOME-$(uname) 2> >(grep -v "BUG in find_stowed_path" 1>&2)

popd >/dev/null
