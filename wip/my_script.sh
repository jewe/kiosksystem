#!/bin/sh
echo "${DEVICE}" >> /var/log/test.log
echo "${ACTION}" >> /var/log/test.log
file "/sys${DEVPATH}" >> /var/log/test.log
echo "-" >> /var/log/test.log
echo /usr/local/my_script2.sh | at now
