#!/bin/bash

export DISPLAY=:0.0


# load global functions
. /opt/tmp/kiosksystem/opt/global_functions

# read scriptname to set servicename
SERVICE="${0##*/}" 
SERVICE=${SERVICE%.*}

kiosklog "$SERVICE" "$SERVICE script started $0"

exit_if_disabled "$SERVICE"


while true; do 
  
	ssh -R 63001:localhost:22 -p 63111 pi@wecld.zapto.org 


  	sleep 1200
  	exit_if_disabled "$SERVICE"
done