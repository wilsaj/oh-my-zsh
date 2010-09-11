# My custom zsh stuff

# ls aliases
alias la='ls -a'
alias lf='ls -FA'
alias ll='ls -lAF'

# pip + virtualenv stuff
PIP_REQUIRE_VIRTUALENV=true
PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUALENV
export PIP_RESPECT_VIRTUALENV

# This will keep emacs TRAMP-mode from wonking out when it tries to connect
if [[ $TERM == "dumb" ]] 
then
    unsetopt zle 
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
fi
