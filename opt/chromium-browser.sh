#!/bin/bash

# read scriptname to set servicename
SERVICE="${0##*/}" 
SERVICE=${SERVICE%.*}

kiosklog "$SERVICE" "$SERVICE step 1"

case "$1" in enabled|disabled) echo "$1" >"/opt/kiosk/services/$SERVICE"; exit ;;  esac

#exit_if_disabled() {
#  read -r SWITCH <"$SERVICE"  
#  test "$SWITCH" = 'enabled' || exit
#}

#exit_if_disabled

#log() {
#  logger -s -- "$0: $*"
#  echo "$( date ): $0: $*" >>"$SERVICE.log" 
#}


# If Chromium crashes (usually due to rebooting), clear the crash flag so we don't have the annoying warning bar
#sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/kiosk/.config/chromium/Default/Preferences
#sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/kiosk/.config/chromium/Default/Preferences

while true; do #rm -rf ~/.{config,cache}/google-chrome/
  #log "gestartet: $SERVICE"
  #chromium-browser --kiosk --no-first-run --incognito --no-default-browser-check --disable-translate --disk-cache-dir=/tmp/cache 'http://localhost'
  #exit_if_disabled
  
  kiosklog "$SERVICE" "chrome started $SERVICE"
  exit 0
done
