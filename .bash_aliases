### COLOUR ###

alias ls='ls -a --color=auto'
#alias ls='ls -al --color=auto'
alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep -i --color=auto'
# i for case insensitive

# i for interactive mode of copy (extra checks)
alias cp='cp -irv'
#alias cp='cp -nrv' 
# no-overwirte, recursive, verbose

# similiar proctection for move (b is for back up)
#alias mv='mv -ib'

#alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Colour:
alias ip='ip -c'

### CONTROL ###

alias restart='sudo shutdown -r now'

### LIST ###

#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

### DMESG ###

alias dmesg='sudo dmesg -w' 

### SSH ###

# VM
alias ssh-vm="ssh 192.168.122.147 -l p34121"
