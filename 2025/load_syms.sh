#!/usr/bin/env bash

###############
# lil utility to check the paths aren't already there...
# then make the path if needed & then link.
create() {
    if [ -e "$2" ] || [ -L "$2" ]; then
        echo "Skipping $2, already exists."
    else
        mkdir -p $(dirname "$2")
        ln -s "$1" "$2" || { echo "Failed to create symlink: $2"; exit 1; }
        echo "Created symlink: $2 -> $1"
    fi
}
###############

# we will load in the common posix/unix configs
# then given the os
# load specic files for either mac or linux 
echo "OSTYPE is #$OSTYPE..."

### common

# shell
create $PWD/shell/.profile $HOME/.profile 
create $PWD/shell/.aliases $HOME/.aliases

# git
create $PWD/git/.gitconfig $HOME/.gitconfig

# terminal multiplexer
create $PWD/tmux/.tmux.conf $HOME/.tmux.conf 

# vscode
create $PWD/vscode/vscodium_settings.json $HOME/.config/VSCodium/User/settings.json
    
# vim/neovim
create $PWD/vim/.vimrc $HOME/.vimrc
create $PWD/vim/init.vim $HOME/.config/nvim/init.vim

# wezterm

create $PWD/wezterm/.wezterm.lua $HOME/.wezterm.lua

### linux

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    # bash
    create $PWD/shell/.bash_profile
    create $PWD/shell/.bashrc $HOME/.bashrc
    
    # xresources (for uRXVT)
    create $PWD/X11/.Xresources $HOME/.Xresources
    
    # hot-key daemon
    create $PWD/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc
    
    # app selector
    create $PWD/rofi/config.rasi $HOME/.config/rofi/config.rasi
    create $PWD/rofi/theme.rasi $HOME/.config/rofi/theme.rasi

    # tiling windows
    create $PWD/i3/config $HOME/.config/i3/config

    # compositor
    create $PWD/picom/picom.conf $HOME/.config/picom.conf

    # polybar 
    create $PWD/polybar/config.ini $HOME/.config/polybar/config.ini
    create $PWD/polybar/launch.sh $HOME/.config/polybar/launch.sh

    # log-in manager
    create $PWD/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
    create $PWD/lightdm/lightdm.conf /etc/lightdm/lightdm-gtk-greeter.conf

fi

### mac

if [[ "$OSTYPE" == "darwin"* ]]; then

    # zsh
    create $PWD/shell/.zprofile $HOME/.zprofile
    create $PWD/shell/.zshrc $HOME/.zshrc

    # hot-key daemon
    create $PWD/skhd/skhdrc $HOME/.config/skhd/skhdrc

    # vscode
    #create $PWD/vscode/vscodium_settings.json "$HOME/Library/Application Support/VSCodium/User/settings.json"

fi