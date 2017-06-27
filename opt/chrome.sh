#!/bin/bash

export DISPLAY=:0.0

# ?
xset -dpms
# screensaver off
xset s off


# If Chromium crashes (usually due to rebooting), clear the crash flag so we don't have the annoying warning bar
#sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/kiosk/.config/chromium/Default/Preferences
#sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/kiosk/.config/chromium/Default/Preferences


while true; do rm -rf ~/.{config,cache}/google-chrome/
  chromium-browser --kiosk --no-first-run --incognito --no-default-browser-check --disable-translate --disk-cache-dir=/tmp/cache 'http://localhost'
done
