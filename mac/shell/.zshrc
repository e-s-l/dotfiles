# .zshrc
# this gets loaded up after the .zprofile

##########
# PROMPT #
##########

PROMPT="%F{blue}%~%2f\$ "
#PROMPT="%F{blue}%~%f\$ "

##########

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

##########

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY
source ~/perl5/perlbrew/etc/bashrc


# load autocompletion
autoload -Uz compinit
compinit
# Load Angular CLI autocompletion.
source <(ng completion script)
