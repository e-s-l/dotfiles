#!/usr/bin/env bash

# Lil utility to check the paths aren't already there...
# then make the path if needed & then link.
create() {
    if [ -e $2 ] || [ -L $2 ]; then
        echo "Skipping $2, already exists."
    else
        mkdir -p $2 && ln -s $1 $2 || { echo "Failed to create symlink: $2"; exit 1; }
        echo "Created symlink:\n$2 -> $1"
    fi
}

#wezterm
create $PWD/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua

#skhd
create $PWD/skhd/skhdrc $HOME/.config/skhd/skhdrc