#!/bin/env bash

# create sym links from the configuration files to the proper locations


create_symlink() {
    if [ -e $2 ] || [ -L $2 ]; then
        echo "Skipping $2, already exists."
    else
        ln -s $1 $2 || { echo "Failed to create symlink: $2"; exit 1; }
        echo "Created symlink: $2 -> $1"
    fi
}

# create_symlink '$PWD/.vimrc' '$HOME/.vimrc' 

ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/.screenrc $HOME/.screenrc
ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.bash_aliases $HOME/.bash_aliases
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -s $PWD/.gitconfig $HOME/.gitconfig
ln -s $PWD/vscodium_settings.json $HOME/.config/VSCodium/User/settings.json
# Seems that the sym links for vscode & conky don't work
# so let's just copy instead:
# hmm pretty sure this ought to work...
cp $PWD/.conkyrc $HOME/.conkyrc

########
# TO DO 
########
#
# - test conky as symlink again 
# - check for those that have directories that they exist 
# - and warn 'perhaps not installed'
# - check sym links already exist
# -
