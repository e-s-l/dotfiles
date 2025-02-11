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

# set-up
ALL="$PWD/cross"
ALLSHELLS="$ALL/shell"

# cross-platform

# shell
create $ALLSHELLS/.profile $HOME/.profile 
create $ALLSHELLS/.aliases $HOME/.aliases
create $ALL/git/.gitconfig $HOME/.gitconfig

# wezterm
create $ALL/terminal/wezterm/wezterm.lua $HOME/.wezterm.lua

# vscode/vscodium
VSCODE="VSCodium"

###############

# platform-specific
echo "OSTYPE is #$OSTYPE..."
if [[ "$OSTYPE" == "darwin"* ]]; then

    ##########
    MAC="$PWD/mac"
    MACSHELL="$MAC/shell"
    MACCONF="$MAC/.config"
    ##########

    # shell profile and runcontrol
    create $MACSHELL/.zprofile $HOME/.zprofile
    create $MACSHELL/.zshrc $HOME/.zshrc
    # skhd
    create $MACCONF/skhd/skhdrc $HOME/.config/skhd/skhdrc
    # vscode
    create $ALL/vscode/vscodium_settings.json "$HOME/Library/Application Support/VSCodium/User/settings.json"
    # neovim
    create $ALL/vim/.vimrc $HOME/.config/nvim/init.vim
    # sketchybar
    create $MACCONF/sketchybar/sketchybarrc $HOME/.config/sketchybar/sketchybarrc
    # hmmm
    cp -r $MACCONF/sketchybar/plugins $HOME/.config/sketchybar/

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
    # vscode
    create $ALL/vscode/vscodium_settings.json $HOME/.config/$VSCODE/User/settings.json
    # vim
    create $ALL/vim/.vimrc $HOME/.vimrc 

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
