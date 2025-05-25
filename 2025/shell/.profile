# profile to be loaded by either bash or zsh

# Check if running Bash or Zsh
if [ -n "$BASH_VERSION" ]; then
    SHELL_TYPE="bash"
elif [ -n "$ZSH_VERSION" ]; then
    SHELL_TYPE="zsh"
fi

#echo $SHELL_TYPE

###########
# HISTORY #
###########

if [ "$SHELL_TYPE" = "bash" ]; then
        
    # don't duplicate lns or lns starting w spaces
    HISTCONTROL=ignoreboth
    # append to history file, don't overwrite:
    shopt -s histappend

elif [ "$SHELL_TYPE" = "zsh" ]; then
    setopt HIST_IGNORE_SPACE HIST_IGNORE_DUPS
fi

# for setting history length see HISTSIZE and HISTFILESIZE 
HISTSIZE=1000
HISTFILESIZE=2000

###############
# ALIAS DEFNS #
###############

# Put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.aliases_work ]; then
    . ~/.aliases_work
fi

########
# PATH #
########

# utility function to add to path (check if exists & not already in path)
add_to_path() {
    # echo "adding $1 to path"
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1:$PATH"
    fi
}

# cross-platform path additions
add_to_path "$HOME/bin" # includes user's bin if it exists
add_to_path "$HOME/.local/bin"  # includes user's private bin if it exists

# also is it alirght to had the sbins for sudo programs
# id -u == 0 (see /etc/profile)

# os-specfic path additions
if [[ "$OSTYPE" == "darwin"* ]]; then

    # bins
    add_to_path "/opt/local/bin"
    add_to_path "/opt/local/sbin"
    add_to_path "/usr/local/bin"
    add_to_path "/usr/local/sbin"

    # apps
    add_to_path "/Applications/PyCharm.app/Contents/MacOS"
    add_to_path "/Applications/WezTerm.app/Contents/MacOS"
    add_to_path "/Applications/VSCodium.app/Contents/Resources/app/bin"

    add_to_path "/opt/homebrew/bin"

	#add_to_path "/opt/local/libexec/gnubin"
	add_to_path "$HOME/Library/Python/3.9/bin"
	

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

    add_to_path "$HOME/Programs/android-platform-tools"

fi

#############################

export NO_AT_BRIDGE=1 

#############################

# FOOL THE BELOW LEADS TO AN INFIINITE LOOP
# if you include loading the profile in the bash run control...

if [ "$SHELL_TYPE" = "bash" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
elif [ "$SHELL_TYPE" = "zsh" ] && [ -f "$HOME/.zshrc" ]; then
    . "$HOME/.zshrc"
fi
