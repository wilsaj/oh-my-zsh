# My custom zsh stuff

# ls aliases
alias la='ls -a'
alias lf='ls -FA'
alias ll='ls -lAF'


# Make python2 the explicit python of choice (for now)
export PYTHON='python2'
export PYTHONPATH='/usr/bin/python2'


# And for pymacs
export PYMACS_PYTHON='python2'


# Don't let pip install anything if not in an active virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true


# virtualenvwrapper config
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh


# This will keep emacs TRAMP-mode from wonking out when it tries to
#  connect to zsh
if [[ $TERM == "dumb" ]] 
then
    unsetopt zle 
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
fi
