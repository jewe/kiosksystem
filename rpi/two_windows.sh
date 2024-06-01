#!/bin/bash

# USAGE
# span.sh command [arguments]
#
# DESCRIPTION
# Executes command, waits for a new window to appear, then stretches that window across the entire screen area.
#
# REQUIREMENTS
# wmctrl - for finding and controlling X windows
# xrandr - for detecting the size of the screens
# bc - for timing how long it takes a new window to appear
#
# EXAMPLES
# span.sh chromium-browser --kiosk http://lorempixel.com/1280/720
# span.sh chromium-browser --start-fullscreen http://lorempixel.com/1280/720

# Check to make sure we have a command to execute
if [ $# -lt 1 ]; then
    echo "Usage: $0 command [arguments]"
    echo "Executes command, waits for a new window to appear, then stretches that window across the entire screen area."
    exit 1
fi

# Allocate some temporary files
WF1=`tempfile`
WF2=`tempfile`
WF3=`tempfile`

# Obtain initial list of windows, and execute command
wmctrl -l >$WF1
echo "$@"
"$@" &

# Wait for a new window (time out after 10 seconds)
echo "Waiting for a new window..."
i=0
while [ $i -le 40 ]
do
    wmctrl -l >$WF2
    grep -Fxvf "$WF1" "$WF2" >$WF3
    if [ $? -eq 0 ]; then break; fi
    sleep 0.25
    i=$(( $i + 1 ))
done
rm "$WF1"
rm "$WF2"
if [ $i -gt 40 ]; then
    rm "$WF3"
    echo "New window took longer than 10 seconds, aborting."
    exit 2
fi

# Extract the Window ID of the new window
WID=`cut -d' ' -f 1 "$WF3"`
TIME=$(bc <<< "scale=2; $i / 4")
echo "Found new window ID $WID after $TIME seconds"
rm "$WF3"

# Obtain dimensions of the screen
echo "Detecting screen dimensions..."
SIZE=`xrandr | head -1 | grep -Eo 'current [0-9]+ x [0-9]+'`
EC=$?
if [ $EC -ne 0 ]; then
    echo "Problem detecting screen dimensions (exit code $EC)"
    exit 3
fi
WIDTH=`echo $SIZE | cut -d' ' -f 2 -`
HEIGHT=`echo $SIZE | cut -d' ' -f 4 -`
echo "Detected screen dimensions ${WIDTH}x${HEIGHT}"

# Reposition the window
echo "Repositioning window..."
wmctrl -ir $WID -b remove,fullscreen
wmctrl -ir $WID -b remove,maximized_vert,maximized_horz
wmctrl -ir $WID -e 0,0,0,$WIDTH,$HEIGHT