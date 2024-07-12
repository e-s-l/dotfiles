#
# remember to run: source ~/.bashrc

###########
# HISTORY #
###########

# don't duplicate lns or lns starting w spaces
HISTCONTROL=ignoreboth

# append to history file, don't overwrite:
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

##########
# PROMPT #
##########

PS1=":\[\033[01;34m\]\w\[\033[00m\]\$ "
#PS1="\$ "

###############
# VIEW WINDOW #
###############

# update LNS & COLS if window changed size:
#shopt -s checkwinsize

###############
# ALIAS DEFNS #
###############

# Put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

if [ -f ~/Code/dotfiles/.bash_aliases ]; then
    . ~/Code/dotfiles/.bash_aliases
fi

###
