#!/bin/bash

# sudo apt install -y xdotool 

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
    # echo $(($1 + RANDOM % $2))
    echo $(shuf -i "$1-$2" -n 1)
}

click () {
  # https://wiki.ubuntuusers.de/xdotool/
  # https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes
  xdotool mousemove $1 $2 click 1 &
  echo "$1, $2"
  sleep $3
}

export DISPLAY=:0.0
echo "sending touch events to screen"


while true; do
  # random
  x="$(random_number $x1 $x2)"
  y="$(random_number $y1 $y2)"
  click $x $y .3


  click $ax $ay .3
  click $ax $ay .3
  click $ax $ay .3
  click $ax $ay .3
  click $ax $ay .3

  click $bx $by 2
  echo "---"
done