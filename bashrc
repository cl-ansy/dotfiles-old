# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ls="ls -h --color=auto"
export PS1='\[\033[01;30m\]\u@\h\n\[\033[00;31m\]\w \$ \[\033[00m\]'

# location of python virtual envs
export WORKON_HOME=$HOME/.virtualenvs
# virtualenvwrapper install location
source /usr/bin/virtualenvwrapper.sh
