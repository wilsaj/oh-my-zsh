# My custom zsh stuff

# special cases for Ubuntu
if [[ -n `uname -a | grep Ubuntu` ]]; then
      export VIRTUALENV_DIR=/usr/local/bin/
   else
      export VIRTUALENV_DIR=/usr/bin/
   fi

# make virtualenvs work with EPD
if [[ -d /usr/local/share/epd ]]; then
      PYTHON_DIR=/usr/local/share/epd/
      PYTHON=${PYTHON_DIR}/bin/python
      PYTHONPATH=${PYTHON_DIR}/bin/python
      export VIRTUALENV_DIR=/usr/local/share/epd/bin/
      export PATH=${PYTHON_DIR}/bin/:${PATH}
   else
      PYTHON=python2
      PYTHONPATH=/usr/bin/python2
   fi


# ls aliases
alias la='ls -a'
alias lf='ls -FA'
alias ll='ls -lAF'

# use hub as a wrapper for git if hub is installed
[[ -x $(whence -p hub) ]] && function git(){hub "$@"}

# editor
export EDITOR='emacsclient'


# Make python2 the explicit python of choice (for now)
export PYTHON=${PYTHON}
export PYTHONPATH=${PYTHONPATH}


# And for pymacs
export PYMACS_PYTHON=${PYTHON}

# Don't let pip install anything if not in an active virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true


# virtualenvwrapper config
export VIRTUALENVWRAPPER_PYTHON=${PYTHONPATH}
export WORKON_HOME=$HOME/.virtualenvs
source ${VIRTUALENV_DIR}/virtualenvwrapper.sh


# make ipython configuration directory
export IPYTHONDIR='~/config/.ipython/'


# make default pager less and don't display control chars (mostly for ipython)
export PAGER=less
export LESS=-r


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
