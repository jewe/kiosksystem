#!/bin/bash


function random_number {

    # we take two parameters: from and to, inclusive
    # we return random number within this range

    echo $(($1 + RANDOM % $2))

}



export DISPLAY=:0.0
echo "sending touch events to screen"

x=$(random_number 50 1800)
y=$(random_number 50 1000)

while true; do
  xdotool mousemove $x $y #click 1 &
  sleep 1
done