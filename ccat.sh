#!/bin/bash
#From @frsilent
#Adds syntax highlighting to a file and prints to stdout
#Requires pygments // http://pygments.org/
#Add to /usr/bin for easy usage
if [ ! -t 0 ]; then
    file=/dev/stdin
elif [ -f $1 ]; then
    file=$1
else
    echo "Usage is $0 code.c"
    echo "or head code.c|$0"
exit 1
fi
printf '\n'
pygmentize -f terminal -g $file | perl -lne 'print $., " ", $_'
printf '\n'