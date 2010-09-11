# My custom zsh stuff

# special cases for Ubuntu
if [[ -n `uname -a | grep Arch` ]]; then
      export VIRTUALENV_DIR=/usr/bin/
   else
      export VIRTUALENV_DIR=/usr/local/bin/
   fi


if [[ `uname` == "Darwin" ]]; then
    export VIRTUALENV_DIR=/usr/local/bin/
    export PATH=/usr/local/bin:/usr/local/Cellar/smlnj/110.75/libexec/bin:${PATH}
    export EDITOR='mvim'
  else
    export EDITOR='gvim'
  fi


DOTFILES_DIR=~/dotfiles/
if [[ -d ${DOTFILES_DIR} ]]; then
      export PATH=${DOTFILES_DIR}/bin:${PATH}
   fi


# ls aliases
alias la='ls -a'
alias lf='ls -FA'
alias ll='ls -lAF'

# easy renaming multiple files
#   source: http://www.mfasold.net/blog/2008/11/moving-or-renaming-multiple-files/
autoload -U zmv
alias mmv='noglob zmv -W'


# convert .mov (e.g. quicktime screen recordings) to optimized gifs
#alias mov2gif=';'
mov2gif() { TMP_CONVERT_FILE="/tmp/_convert_$1.gif"; ffmpeg -i $1 -pix_fmt rgb24 -r 4 $TMP_CONVERT_FILE && mv $TMP_CONVERT_FILE $2 }

# use hub as a wrapper for git if hub is installed
[[ -x $(whence -p hub) ]] && function git(){hub "$@"}

# just a shorthand variable for referencing dotfiles dir in other paths
DOTFILES=${HOME}/dotfiles

# default coffeelint config file
export COFFEELINT_CONFIG=${DOTFILES}/coffeelint.json

# Make python2 the explicit python of choice (for now)
export PYTHON=${PYTHON}
export PYTHONPATH=${PYTHONPATH}

# And for pymacs
export PYMACS_PYTHON=${PYTHON}

# Don't let pip install anything if not in an active virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

# virtualenvwrapper config
export VIRTUALENVWRAPPER_PYTHON=${PYTHON}
export WORKON_HOME=$HOME/.virtualenvs
source ${VIRTUALENV_DIR}/virtualenvwrapper.sh

# make ipython configuration directory
export IPYTHONDIR=${DOTFILES}/.ipython/

# make less the default pager and don't display control chars (mostly for ipython)
export PAGER=less
export LESS=-r

# add cabal to $PATH
export PATH=~/.cabal/bin:$PATH

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

# helper function that just shows HTTP headers returned by a given HTTP request
headers(){curl -sD - $@ -o /dev/null;}

# disable autocorrect - it can be annoying often
unsetopt correct_all
unsetopt correct

# restore some of the keybinds from non-vi-mode
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^b' backward-char
bindkey '^k' kill-line
bindkey '^y' yank

export PATH=/usr/local/bin:$PATH
