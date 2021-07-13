#!/bin/bash
#echo "use agent forwarding / ssh -A "

cd /opt/tmp/
git clone git@gitlab.com:jewe/kiosk_secrets.git
cd kiosk_secrets/
sh setup.sh