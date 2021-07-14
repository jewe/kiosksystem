#!/bin/bash

x1=0
x2=1920
y1=0
y2=1080



random_number {
    # we take two parameters: from and to, inclusive
    # we return random number within this range
    echo $(($1 + RANDOM % $2))
}



export DISPLAY=:0.0
echo "sending touch events to screen"


while true; do
  # random
  x=$(random_number x1 x2)
  y=$(random_number y1 y2)
  xdotool mousemove x y click 1 &
  sleep 5

  echo "---"
done