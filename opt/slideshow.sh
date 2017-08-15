#!/bin/bash

export DISPLAY=:0.0

# wait for display manager
sleep 10

# disable DPMS (Energy Star) features
xset -dpms
# screensaver off
xset s off
# don't blank the video device
xset s noblank

# load global functions
. /opt/tmp/kiosksystem/opt/global_functions

# read scriptname to set servicename
SERVICE="${0##*/}" 
SERVICE=${SERVICE%.*}

kiosklog "$SERVICE" "$SERVICE script started $0"

exit_if_disabled "$SERVICE"

while true; do 
  #rm -rf ~/.{config,cache}/google-chrome/
  kiosklog "$SERVICE" "$SERVICE started"
  gthumb --fullscreen --slideshow /home/kiosk/Pictures 
  kiosklog "$SERVICE" "$SERVICE crashed"
  sleep 6 # to get time to open terminal (ctrl-alt t)
  exit_if_disabled "$SERVICE"
done
