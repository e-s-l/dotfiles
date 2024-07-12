#!/bin/bash

# create sym links from the configuration files to the proper locations

echo "Creating sym-links..."

ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/vscode_settings.json $HOME/.config/Code/User/settings.json
ln -s $PWD/.screenrc $HOME/.screenrc
ln -s $PWD/.conkyrc $HOME/.conkyrc
ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.bash_aliases $HOME/.bash_aliases
ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -s $PWD/.gitconfig $HOME/.gitconfig

