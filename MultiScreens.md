## Monitor Setup 

sudo apt-get install compizconfig-settings-manager

General Options - Display Settings:
Detect outputs: disable
Outputs:
1920x2160+0+0

# find device names
xrandr

# set position
xrandr --output HDMI-2 --pos 0x1080

on Ubuntu Mate call 
compiz --replace





xrandr --output HDMI-2 --pos 0x0 --mode 1920x1080
xrandr --output HDMI-3 --pos 1920x0 --mode 1920x1080

xrandr --output HDMI-0 --pos 0x0 --mode 3840x2160
xrandr --output HDMI-1 --pos 3840x0 --mode 3840x2160
