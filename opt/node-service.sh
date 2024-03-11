#!/bin/bash

# load global functions
. /opt/tmp/kiosksystem/opt/global_functions

# read scriptname to set servicename
SERVICE="${0##*/}" 
SERVICE=${SERVICE%.*}

kiosklog "$SERVICE" "$SERVICE script started $0"

exit_if_disabled "$SERVICE"

while true; do 
  # insert node command here
  cd /var/www/html/gsa-sophie-2024/
  node .output/server/index.mjs
  sleep 60
  exit_if_disabled "$SERVICE"
done