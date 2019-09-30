# WIP: Transform Video output by custom matrix






# change
xrandr --output HDMI-3 --transform 0.80,0,35,0,1.04,19,0,0,1
# reset
xrandr --output HDMI-3 --transform 1,0,0,0,1,0,0,0,1





# works
xrandr --output HDMI-3 --mode 3840x2160 --transform 1.16129,0.12903,-116.12903,0,1.16129,0,0,0.00018,1
xrandr --output HDMI-3 --mode 3840x2160 --transform 1.138889,0.111111,-100.000000,0.000000,1.138889,0.000000,0.000000,0.000154,1.000000
xrandr --output HDMI-3 --mode 3840x2160 --transform 1.135417,0.111111,-100.000000,0.000000,1.135417,0.000000,0.000000,0.000150,1.000000
xrandr --output HDMI-3 --mode 3840x2160 --transform 1.000000,-0.097561,0.000000,0.000000,0.878049,0.000000,-0.000000,-0.000136,1.000000
xrandr --output HDMI-3 --transform 1.052083,0.046296,-100,0,1.052083,0,0,0.000024,1



For example, the transformation scaling horizontal coordinates by 0.8, vertical coordinates by 1.04 and moving the screen by 35 pixels right and 19 pixels down, is:

$ xrandr --output HDMI1 --transform 0.80,0,-35,0,1.04,-19,0,0,1

https://jlk.fjfi.cvut.cz/arch/manpages/man/xrandr.1#RandR_version_1.3_options




# helper
https://github.com/jewe/xrandr-keystone-helper

git clone https://github.com/jewe/xrandr-keystone-helper.git
cd xrandr-keystone-helper

sudo apt -y install python3
sudo apt-get -y install python3-tk 
pip3 install matplotlib
pip3 install numpy

python3 xrandr-keystone-helper.py