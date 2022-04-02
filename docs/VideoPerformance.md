# screen tearing
https://learnubuntumate.weebly.com/screen-tearing-on-intel-graphics.html

# NVIDIA Drivers
https://phoenixnap.com/kb/install-nvidia-drivers-ubuntu

# Nvidia stripe problem
https://boggsman.com/2020/05/nvidia-screen-tearing-on-linux/
Nvidia settings > 2.Pkt: X Server Display ... > Advanced > Force full composition pipeline


# GRUB
https://askubuntu.com/questions/148095/how-do-i-set-the-grub-timeout-and-the-grub-default-boot-entry/148097#148097

# VLC

http://testpattern.jewe.net


HEVC = H.265 = MPEG-H Teil 2

https://www.howtogeek.com/howto/windows/fix-for-vlc-skipping-and-lagging-playing-high-def-video-files/
HEVC
- Tools -> Settings
- Select "All" (in the lower left corner)
- Input / codecs ->Video Codecs -> FFmpeg
- Set "Threads" to 1



## Asus Celeron

### HD
WW_1920x1080_50_h264

80% CPU, keine dropped Frames
Keine entscheidenden Verbesserungen bei Änderung der VLC-Einstellungen

Für 4K keine Abspielmöglichkeit


## ZBox

2x 4K
35% CPU, aber dropped Frames, visuell ok


# Shuttle DH02U
VLC 2x_4K on 4K monitor:
    X-server: 10% of frames shown
    NVIDIA: 