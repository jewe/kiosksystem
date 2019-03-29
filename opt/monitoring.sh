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
  
	now=$(date +"%m-%d")
	file="/opt/logs/$now_monitoring.log"
	
	"\n---\n" >> "$file"
	$(date +"%H:%M") >> "$file"
	sensors >> "$file"


  	sleep 600
  	exit_if_disabled "$SERVICE"
done