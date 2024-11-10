#!/usr/bin/env bash
#
# create sym links from the configuration files to the proper locations
#

create_symlink() {
    if [ -e $2 ] || [ -L $2 ]; then
        echo "Skipping $2, already exists."
    else
        ln -s $1 $2 || { echo "Failed to create symlink: $2"; exit 1; }
        echo "Created symlink: $2 -> $1"
    fi
}

# dot files
create_symlink $PWD/.Xresources $HOME/.Xresources
create_symlink $PWD/sxhkdrc $HOME/.config/sxhkd/sxhkdrc
create_symlink $PWD/.vimrc $HOME/.vimrc 
create_symlink $PWD/.tmux.conf $HOME/.tmux.conf 
create_symlink $PWD/.screenrc $HOME/.screenrc 
create_symlink $PWD/.bashrc $HOME/.bashrc 
create_symlink $PWD/.bash_aliases $HOME/.bash_aliases
create_symlink $PWD/.gitconfig $HOME/.gitconfig 
create_symlink $PWD/conky_configuration/.conkyrc $HOME/.conkyrc

# other config
create_symlink $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml 
create_symlink $PWD/vscodium_settings.json $HOME/.config/VSCodium/User/settings.json

# Note: 
# For windows, we also use these last two.
# Their locations are:
# %appdata%\Roaming\alacritty\alacritty.toml
# %appdata%\Roaming\Code\User\settings.json

#########
# TO DO #
#########
#
# - test conky as symlink again 
# - check for those that have directories that they exist 
# - and warn 'perhaps not installed'
#
