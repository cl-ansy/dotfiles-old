# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

#where to store python virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
#location that virtualenvwrapper was installed to
source /usr/bin/virtualenvwrapper.sh
