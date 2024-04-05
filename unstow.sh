#!/usr/bin/env bash

# Unstow packages
for d in */; do
    srcdir=${d/\//}
    if [[ $srcdir = "ROOT" ]]; then
	stow -Dt / $srcdir 2> >(grep -v "BUG in find_stowed_path" 1>&2)
    else
	stow -Dt ~ $srcdir 2> >(grep -v "BUG in find_stowed_path" 1>&2)
    fi
done

