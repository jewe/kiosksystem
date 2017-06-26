#!/bin/bash

# ?
xset -dpms
# screensaver off
xset s off


while true; do rm -rf ~/.{config,cache}/google-chrome/
  chromium-browser --kiosk --no-first-run --incognito --no-default-browser-check --disable-translate --disk-cache-dir=/tmp/cache 'http://localhost'
done
