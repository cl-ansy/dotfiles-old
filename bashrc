# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ls="ls -h --color=auto"
alias gls="git status"
export PS1="\[\e[00;37m\]\u@\h:\[\e[0m\]\[\033[00;31m\][\w]\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"

# location of python virtual envs
export WORKON_HOME=$HOME/.virtualenvs
# virtualenvwrapper install location
source /usr/bin/virtualenvwrapper.sh
