#!/usr/bin/env bash

###############
# lil utility to check the paths aren't already there...
# then make the path if needed & then link.
create() {
    if [ -e $2 ] || [ -L $2 ]; then
        echo "Skipping $2, already exists."
    else
        mkdir -p $(dirname "$2")
        ln -s $1 $2 || { echo "Failed to create symlink: $2"; exit 1; }
        echo "Created symlink: $2 -> $1"
    fi
}

###############

# set-up
ALL="$PWD/cross"
ALLSHELLS="$ALL/shell"

# cross-platform
create $ALLSHELLS/.profile $HOME/.profile 
create $ALLSHELLS/.aliases $HOME/.aliases
create $ALL/git/.gitconfig $HOME/.gitconfig
create $PWD/vim/.vimrc $HOME/.vimrc 

# vscode/vscodium
VSCODE="VSCodium"
create $PWD/vscode/vscodium_settings.json $HOME/.config/$VSCODE/User/settings.json

# platform-specific
echo "OSTYPE is #$OSTYPE..."
if [[ "$OSTYPE" == "darwin"* ]]; then

    ##########
    MACSHELL="$PWD/mac/shell"
    ##########

    # shell profile and runcontrol
    create $MACSHELL/.zprofile $HOME/.zprofile
    create $MACSHELL/.zshrc $HOME/.zshrc
    # wezterm
    create $PWD/mac/terminal/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua
    # skhd
    create $PWD/mac/skhd/skhdrc $HOME/.config/skhd/skhdrc

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

    ##################################
    LINUX="$PWD/linux"
    ##########
    # home or work linux configuration
    ##########
    TYPE="home" # work
    LINUXCONF="$LINUX/${TYPE}_config"
    echo "Linux conf is $LINUXCONF"
    ##################################

    # bash run control
    create $LINUXCONF/shell/.bashrc $HOME/.bashrc
    # xresources (for uRXVT)
    create $LINUXCONF/X11/.Xresources $HOME/.Xresources
    # hot-key daemon
    create $LINUX/sxhkdrc $HOME/.config/sxhkd/sxhkdrc
    # terminal multiplexer
    create $LINX/.tmux.conf $HOME/.tmux.conf 
    # HUD
    create $LINUX/conky/.conkyrc $HOME/.conkyrc
    # app selector
    create $LINUX/rofi/config.rasi $HOME/.config/rofi/config.rasi
    create $LINUX/rofi/theme.rasi $HOME/.config/rofi/theme.rasi

fi

##############
# some notes #
##############

# Do we want nvim and vim to share a config file? if so
#create_link $PWD/.vimrc $HOME/.config/nvim/init.vim

# For windows, we also use wezterm and vscode, so...
# Their locations are:
# %appdata%\Roaming\Code\User\settings.json
# %home%\.wezterm.lua

#########
# TO DO #
#########
# - and warn 'perhaps not installed'
# - add options to install basic config (bash, tmux, x) from different
# directories (work, home...)
