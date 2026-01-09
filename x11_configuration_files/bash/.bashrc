############################

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

############################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#############################
### HISTORY CONFIGURATION ###
#############################


# Append to the history file, don't overwrite it.
shopt -s histappend

# Set history length (number of commands remembered).
HISTSIZE=1000
HISTFILESIZE=2000

HISTCONTROL=ignoreboth:ignoredups:erasedups 

# https://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux 
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


########################
# WINDOW SIZE SETTINGS
########################

# Check the window size after each command and update LINES and COLUMNS if necessary.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

######################
# LESS CONFIGURATION
######################

# Make `less` more friendly for non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

######################
# CHROOT IDENTIFIER
######################

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

###########
# ALIASES #
###########

if [ -f ~/.aliases ]; then     
    . ~/.aliases 
fi 

######################
### PROMPT CONFIG. ###
######################

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" 


####################
# COMPLETION
####################

# Enable programmable completion features if not already enabled.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

######################
### TMUX AUTOSTART ###
######################

tmux_autostart=

if [ "$tmux_autostart" = yes ]; then
    case "$TERM" in     
        rxvt-unicode-256color | screen-256color)         
            if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then       
                exec tmux       
            fi       
            ;;     
        xterm-256color)         
            # No tmux startup in XFCE Terminal (or similar terminals)         
            ;;     
        *)         
            # For other terminal types, don't start tmux         
            ;; 
    esac 
fi
. "$HOME/.cargo/env"
