#!/bin/bash

export DISPLAY=:0.0

# load global functions
. /opt/tmp/kiosksystem/opt/global_functions

# read scriptname to set servicename
SERVICE="${0##*/}" 
SERVICE=${SERVICE%.*}

kiosklog "$SERVICE" "$SERVICE script started $0"

exit_if_disabled "$SERVICE"

while true; do 
  kiosklog "$SERVICE" "$SERVICE started"
  vlc ~/Pictures/station.mov --fullscreen --no-mouse-events --loop --no-osd --no-audio  
  kiosklog "$SERVICE" "$SERVICE crashed"
  sleep 6 # to get time to open terminal (ctrl-alt t)
  exit_if_disabled "$SERVICE"
done


