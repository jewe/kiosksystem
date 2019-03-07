https://askubuntu.com/questions/554273/executing-a-script-when-inserting-a-flash-drive


#!/usr/bin/env python3

import subprocess
import time

#--
drivename_folders = [("My Passport", "docs"), ("7827-2F8C", "sanel")]
#--

def get_mountedlist():
    return [item[item.find("/"):] for item in subprocess.check_output(
            ["/bin/bash", "-c", "lsblk"]).decode("utf-8").split("\n") if "/" in item]

done = []

while True:
    mounted = get_mountedlist()
    new_paths = [dev for dev in mounted if not dev in done]
    valid = sum([[(drive, drive+"/"+item[1], item[0]) for drive in new_paths \
                  if item[0] in drive] for item in drivename_folders], [])

    for item in valid:
        open_window = "nautilus  "+"'"+item[1]+"'"
        close_window = "wmctrl -c  "+"'"+item[2]+"'"
        subprocess.Popen(["/bin/bash", "-c", open_window])
        time.sleep(1)
        subprocess.Popen(["/bin/bash", "-c", close_window])

    done = mounted
    time.sleep(2)




    #!/usr/bin/env python3

import subprocess
import time

#--
drivename_command = [("My Passport", "gnome-terminal"), ("F806-0C50", "gedit")]
#--

def get_mountedlist():
    return [item[item.find("/"):] for item in subprocess.check_output(
            ["/bin/bash", "-c", "lsblk"]).decode("utf-8").split("\n") if "/" in item]

done = []

while True:
    mounted = get_mountedlist()
    newly_mounted = [dev for dev in mounted if not dev in done]
    valid = sum([[(drive, item[1]) for drive in newly_mounted \
                  if item[0] in drive] for item in drivename_command], [])
    for item in valid:
        subprocess.Popen(["/bin/bash", "-c", item[1]])
    done = mounted
    time.sleep(2)