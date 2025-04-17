#!/bin/bash
# disable DPMS (Energy Star) features
xset -dpms
# screensaver off
xset s off
# don't blank the video device
xset s noblank

chromium-browser --new-window --user-data-dir=/tmp/browser-1 --window-position=   "0,0" --start-fullscreen --kiosk --touch-events=enabled --disable-pinch --noerrdialogs --disable-session-crashed-bubble --simulate-outdated-no-au="Tue, 31 Dec 2099 23:59:59 GMT" --disable-component-update --overscroll-history-navigation=0 --disable-translate --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null --app="http://localhost:3000" &
chromium-browser --new-window --user-data-dir=/tmp/browser-2 --window-position="1920,0" --start-fullscreen --kiosk --touch-events=enabled --disable-pinch --noerrdialogs --disable-session-crashed-bubble --simulate-outdated-no-au="Tue, 31 Dec 2099 23:59:59 GMT" --disable-component-update --overscroll-history-navigation=0 --disable-translate --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null --app="http://localhost:3000"
exit;