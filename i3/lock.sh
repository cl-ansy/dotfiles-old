#!/bin/bash
#dependencies: scrot, imagemagick, i3lock
tmpfile=$(mktemp --suffix=.png)
scrot $tmpfile
# convert $tmpfile -scale 25% -scale 400% $tmpfile
convert $tmpfile -blur 0x5 $tmpfile
i3lock -i $tmpfile
rm $tmpfile