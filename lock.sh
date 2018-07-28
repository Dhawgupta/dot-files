#!bin/bash
ICON=$HOME/.xlock/icon.png
TMPBG=$HOME/.config/screenshots/screen.png

#Take the screenshot of the current screen
scrot $HOME/.config/screenshots/screen.png

#Use the imagemagick package to convert the image
convert $TMPBG -paint 4 -swirl 760 $TMPBG

#Take the icon's image and merge it with the $TMPBG 
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG

#Finally load the image in the i3lock
i3lock -u -i $TMPBG

