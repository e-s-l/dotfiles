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

# shell
create $PWD/shell/.profile $HOME/.profile 
create $PWD/shell/.aliases $HOME/.aliases

# git
create $PWD/git/.gitconfig $HOME/.gitconfig

# bash run control
create $PWD/shell/.bashrc $HOME/.bashrc
    
# xresources (for uRXVT)
create $PWD/X11/.Xresources $HOME/.Xresources
    
# hot-key daemon
create $PWD/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc
    
# terminal multiplexer
create $PWD/tmux/.tmux.conf $HOME/.tmux.conf 
  
# app selector
create $PWD/rofi/config.rasi $HOME/.config/rofi/config.rasi
create $PWD/rofi/theme.rasi $HOME/.config/rofi/theme.rasi
    
# vscode
create $PWD/vscode/vscodium_settings.json $HOME/.config/VSCodium/User/settings.json
    
# vim/neovim
create $PWD/vim/.vimrc $HOME/.vimrc
create $PWD/vim/init.vim $HOME/.config/nvim/init.vim

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
