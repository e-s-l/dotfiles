# .zprofile
# this get's loaded up first

###########
# PROFILE #
###########

# Source .profile for shared settings
#if [ -f ~/.profile ]; then
#    . ~/.profile
#fi

#################
# BREW SETTINGS #
################

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

<<<<<<< HEAD:mac/shell/.zprofile
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
=======
########
# PERL #
########

source ~/perl5/perlbrew/etc/bashrc
>>>>>>> 30d28a884561be606f30e2f060b092832c2bf92c:2024/mac/shell/.zprofile
