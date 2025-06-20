# profile to be loaded by shell (*eg* zsh or bash) profile

###############
# ALIAS DEFNS #
###############

if [ -f ~/.aliases ]; then
    . ~/.aliases
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
add_to_path "$HOME/bin"
add_to_path "$HOME/.local/bin"

# os-specfic path and environment settings

if [[ "$OSTYPE" == "darwin"* ]]; then

    #######
    # mac #
    #######

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

    export HOMEBREW_NO_AUTO_UPDATE
    export HOMEBREW_NO_ENV_HINTS
	

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    
    #########
    # linux #
    #########

    add_to_path "$HOME/Programs/android-platform-tools"
    add_to_path "/opt/floorp"
    add_to_path "/opt/idea/bin"
    add_to_path "/opt/android-studio/bin"

    # for dbind
    # what does this do again?
    export NO_AT_BRIDGE=1 

fi