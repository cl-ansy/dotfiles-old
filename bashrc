# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ls="ls -h --color=auto"
alias gls="git status"
alias gfr="git fetch; git rebase"
alias weessh="ssh cslansing@cslansing.com -t screen -D -RR weechat weechat-curses"
alias python="/usr/bin/python3"
export PS1="\[\e[00;37m\]\u@\h:\[\e[0m\]\[\033[00;31m\][\w]\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"

# location of python virtual envs
export WORKON_HOME=$HOME/.virtualenvs
# virtualenvwrapper install location
source /usr/bin/virtualenvwrapper.sh

# Java SDK location
export JAVA_HOME=/opt/jdk1.8.0_71
export VAGRANT_DEFAULT_PROVIDER=virtualbox

#export PYTHONPATH=~/z/kivy:$PYTHONPATH

