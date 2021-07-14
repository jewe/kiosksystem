#!/bin/bash

x1=0
x2=1920
y1=0
y2=1080

# next img
ax=3570
ay=1100

# back
bx=160
by=1910

random_number () {
    # we take two parameters: from and to, inclusive
    # we return random number within this range
    echo $(($1 + RANDOM % $2))
}

click () {
  # https://wiki.ubuntuusers.de/xdotool/
  xdotool mousemove $1 $2 click 1 &
  echo "$1, $2"
  sleep $3
}

export DISPLAY=:0.0
echo "sending touch events to screen"


while true; do
  # random
  x=$(random_number x1 x2)
  y=$(random_number y1 y2)
  $(click x y 1)


  $(click bx by 1)
  $(click bx by 1)

  $(click ax ay 1)
  echo "---"
done