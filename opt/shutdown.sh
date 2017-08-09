#!/bin/sh

# needs:
# grep -q ^'user' /etc/sudoers || echo 'user ALL=NOPASSWD:/sbin/shutdown' >>/etc/sudoers


kiosklog "kiosk" "shutdown"

shutdown now