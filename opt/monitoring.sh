#!/bin/bash

export DISPLAY=:0.0


sleep 10


# load global functions
. /opt/tmp/kiosksystem/opt/global_functions

# read scriptname to set servicename
SERVICE="${0##*/}" 
SERVICE=${SERVICE%.*}

kiosklog "$SERVICE" "$SERVICE script started $0"

exit_if_disabled "$SERVICE"


while true; do 
  
	nnow=$(date +"%m-%d")
	file="/opt/logs/$now-monitoring.log"
	
	echo "\n---" >> "$file"
	echo $(date +"%H:%M") >> "$file"
	sensors >> "$file"


  	sleep 1200
  	exit_if_disabled "$SERVICE"
done