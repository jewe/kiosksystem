#!/bin/bash

export DISPLAY=:0.0

# wait for display manager
sleep 1

# disable DPMS (Energy Star) features
xset -dpms
# screensaver off
xset s off
# don't blank the video device
xset s noblank

unclutter -idle 0 &

# xrandr --output HDMI-1 --pos 0x0 --mode 1920x1080 --rotate ${ROTATION}


