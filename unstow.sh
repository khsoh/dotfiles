#!/usr/bin/env bash

# Unstow packages
stow -Dt / ROOT 2> >(grep -v "BUG in find_stowed_path" 1>&2)
stow -Dt ~ HOME 2> >(grep -v "BUG in find_stowed_path" 1>&2)

