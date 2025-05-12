# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

###########
# PROFILE #
###########

# Source .profile for shared settings
if [ -f ~/.profile ]; then
    . ~/.profile
fi

############################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#############################
# HISTORY CONFIGURATION
#############################

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# Set history length (number of commands remembered).
HISTSIZE=1000
HISTFILESIZE=2000

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

#####################
# PROMPT CONFIG
#####################

# Set a fancy prompt (non-color, unless we know we "want" color).
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# If this is an xterm, set the title to user@host:dir.
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

####################
# COLOR SUPPORT
####################

# Enable color support for ls and add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#######################
# ALIASES CONFIGURATION
#######################

# Add all user-defined aliases from separate files.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi


##########
# COLOUR #
##########

case "$TERM" in
    rxvt-unicode-256color | screen-256color)

        # Uncomment for a colored prompt, if the terminal has the capability.
        force_color_prompt=yes

        if [ -n "$force_color_prompt" ]; then
            if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
                # We have color support.
                color_prompt=yes
            else
                color_prompt=
            fi
        fi

        if [ "$color_prompt" = yes ]; then
            PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\w\[\033[00m\]\$ '
        else
            PS1='${debian_chroot:+($debian_chroot)}\w\$ '
        fi


		###################
		# TMUX AUTO START #
		###################

      #  if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      #    exec tmux
      #  fi

      #  unset color_prompt force_color_prompt


        ;;
    xterm-256color)
        # No tmux startup in XFCE Terminal (or similar terminals)
        ;;
    *)
        # For other terminal types, don't start tmux
        ;;
esac


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


########
# PATH #
########

export PATH=$PATH:~/bin
