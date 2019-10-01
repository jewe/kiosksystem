#!/bin/bash

#echo "2. script" >> /var/log/test.log
#env >> /var/log/test.log
#file "/sys${DEVPATH}" >> /var/log/test.log

# wait for mounted device
sleep 5

#df --output=target "${DEVNAME}" | tail -1 >> /var/log/test.log

# set mountpoint of device
USBPATH=$(df --output=target "${DEVNAME}" | tail -1)

#ls -la "/media/user" >> /var/log/test.log
#echo "/media/user/${ID_FS_LABEL_ENC}" >> /var/log/test.log 

FILE="${USBPATH}/usb-update.conf"

echo "file $FILE" >> /var/log/test.log

if [ -f "$FILE" ]; then
    echo "$FILE exist" >> /var/log/test.log
    notify-send "Starte Update" >> /var/log/test.log
    . "$FILE"
    echo "rsync ${USBPATH}/$source_dir $target_dir" >> /var/log/test.log
    rsync -a "${USBPATH}/${target}" "$target_dir"
    if ["$backup_enabled" = 'true']
        echo "Backup on" >> /var/log/test.log
    fi


else 
    echo "$FILE does not exist" >> /var/log/test.log
fi




ls -la "${USBPATH}/" >> /var/log/test.log 2>&1

echo "- - -" >> /var/log/test.log

#if [ "${ACTION}" = "add" ] && [ -f "${DEVICE}" ]
#then
#    echo "${DEVICE}" >> /var/log/test.log
#fi
#echo "- - - -" >> /var/log/test.log
#echo "${DEVICE}" >> /var/log/test.log
