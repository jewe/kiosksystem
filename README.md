# Ubuntu Kiosksystem

## Installation
Download Ubuntu MATE 
set autoconfig url:
https://raw.githubusercontent.com/jewe/kiosksystem/master/autoinstall.yaml


ssh-copy-id user@192.168.10.56

### Login via ssh
```
ssh user@192.168.0...
```

### Setup Kiosksystem
```
sudo chmod 0777 /opt && mkdir -p /opt/tmp && cd /opt/tmp/ && git clone https://github.com/jewe/kiosksystem.git && cd kiosksystem && sh setup_system.sh
```

# remote host identification has changed
ssh-keygen -R 192.168.0...


After Reboot login as kiosk@ip and:
```
cd /opt/tmp/kiosksystem/
sh setup_kiosk_user.sh
sh install_kiosk_software.sh
```

optional:

install developer tools 
```
sh install_dev_software.sh
```
jwm-2570:kiosksystem$ ssh-add ~/.ssh/id_rsa
ssh-add -L

cd /opt/tmp/kiosksystem/
sh setup_secrets.sh

install applications:
```
cd /opt/tmp/kiosksystem/
sh install_chromium-browser.sh
sh install_slideshow.sh

# mount ro etc.
sh lockdown.sh
```

## Slideshow

add images to
```
/home/kiosk/Pictures
```

config autostart-script:
```
sudo nano /opt/slideshow.sh
```

enable autostart (as user)
```
kioskctl enable slideshow
```

disable autostart (as user)
```
kioskctl disable slideshow
```


## Multiple Screens
compizconfig-settings-manager package needed
Control Center: Look and Feel: CompizConfig Settings Manager: General Options: Display Settings:
-> uncheck "Detect outputs"
-> remove all settings in "Outputs"
xrandr --output HDMI -pos 100x0


# Secrets 
jwm-2570:kiosksystem jensweber$ ssh-add ~/.ssh/id_rsa
ssh-add -L


# Desktop config
dconf-editor