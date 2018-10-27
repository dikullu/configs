#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

if xrandr | grep -q 'eDP-1 connected' ; then
    xrandr --output eDP-1 --mode 2048x1152
fi

run setxkbmap dk
run xmodmap .Xmodmap
