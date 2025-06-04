#
#
#

[ -f ~/.profile ] && . ~/.profile
[ -f ~/.zshrc ] && . ~/.zshrc

#################
# BREW SETTINGS #
################

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

# Setting PATH for Python 3.12
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# extfuse
export PATH="/opt/ext4fuse/bin:$PATH"

# scripts directory
export PATH="$HOME/scripts:$PATH"
