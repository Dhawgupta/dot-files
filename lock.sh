#!bin/bash
ICON=$HOME/.xlock/icon.png
TMPBG=$HOME/.config/screenshots/screen.png
scrot $HOME/.config/screenshots/screen.png
convert $TMPBG -paint 5 -swirl 360 $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -i $TMPBG

