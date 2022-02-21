#!/bin/bash

export DISPLAY=:0.0

# wait for display manager
sleep 5

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

# If Chromium crashes (usually due to rebooting), 
# clear the crash flag so we don't have the annoying warning bar
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/kiosk/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/kiosk/.config/chromium/Default/Preferences

sleep 5 # otherwise ignores -kiosk

while true; do 
  #rm -rf ~/.{config,cache}/google-chrome/
  kiosklog "$SERVICE" "$SERVICE started"
  chromium-browser --kiosk --no-first-run --incognito --no-default-browser-check --disable-pinch --enable-precise-memory-info --max_old_space_size=4096 --disable-translate --disable-features=TranslateUI --disk-cache-dir=/tmp/cache --disable-gpu-vsync --disable-frame-rate-limit 'http://localhost'
  kiosklog "$SERVICE" "$SERVICE crashed"
  sleep 6 # to get time to open terminal (ctrl-alt t)
  exit_if_disabled "$SERVICE"
done


# --enable-logging
# ~/.config/google-chrome/chrome_debug.log 
