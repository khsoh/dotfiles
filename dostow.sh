#!/usr/bin/env bash

pushd "$(dirname $0)" > /dev/null

# Sets up the symlinks with stow
for d in */; do
    srcdir=${d/\//}
    if [[ $srcdir = "ROOT" ]]; then
	stow -Rt / $srcdir 2> >(grep -v "BUG in find_stowed_path" 1>&2)
    else
	stow -Rt ~ $srcdir 2> >(grep -v "BUG in find_stowed_path" 1>&2)
    fi
done

popd >/dev/null
