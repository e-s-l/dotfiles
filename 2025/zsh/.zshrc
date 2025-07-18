# .zshrc
# this gets loaded up after the .zprofile

##########
# PROMPT #
##########

PROMPT="%F{blue}%~%2f\$ "
#PROMPT="%F{blue}%~%f\$ "

##########

#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init - zsh)"

###########
# history #
###########

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY

############
# perlbrew #
############

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
source ~/perl5/perlbrew/etc/bashrc

########################
# node version manager #
########################
# super fucking slow
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Lazy-load NVM on first use of nvm, node, npm, or npx
export NVM_DIR="$HOME/.nvm"

_nvm_lazy_load() {
  # Load nvm only once
  unset -f node npm npx nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

nvm() {
  _nvm_lazy_load
  nvm "$@"
}

node() {
  _nvm_lazy_load
  node "$@"
}

npm() {
  _nvm_lazy_load
  npm "$@"
}

npx() {
  _nvm_lazy_load
  npx "$@"
}

########################
# angular command line #
########################

# Load Angular CLI autocompletion.
#source <(ng completion script)

