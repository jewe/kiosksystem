#!/bin/bash

export DISPLAY=:0.0

# ?
xset -dpms
# screensaver off
xset s off

while true; do 
  gthumb --fullscreen --slideshow /home/kiosk/Pictures 
done
