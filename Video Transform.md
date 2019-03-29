






# change
xrandr --output HDMI-3 --transform 0.80,0,35,0,1.04,19,0,0,1
# reset
xrandr --output HDMI-3 --transform 1,0,0,0,1,0,0,0,1




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