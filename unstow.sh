#!/usr/bin/env bash

# Unstow packages
for d in */; do
    stow -Dt ~ ${d/\//} 2> >(grep -v "BUG in find_stowed_path" 1>&2)
done

