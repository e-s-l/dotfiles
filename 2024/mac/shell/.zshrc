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

##########

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY

PATH="/Users/pearl/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/pearl/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/pearl/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/pearl/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pearl/perl5"; export PERL_MM_OPT;
