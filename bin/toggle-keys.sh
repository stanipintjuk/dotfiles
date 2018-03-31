#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=/tmp/lksajdlkfj9823jlksjd9f8j23il4k2j0f8 #truly a random number

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    setxkbmap us
else
    rm $TOGGLE
    setxkbmap se
fi
