# Touchscreens

xinput_calibrator
sudo apt install xinput-calibrator

- make permanent

## Alternative
xinput --list
xinput set-props "Devicename" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1


xscale 0 -xoffset
0 yscale -yoffset
0 0 1

SH Touch:
xinput set-prop "Elo TouchSystems Elo TouchSystems Surface Capacitive 5020" "libinput Calibration Matrix" 1.19 0 -0.088 0 1.20 -0.10667 0 0 1
