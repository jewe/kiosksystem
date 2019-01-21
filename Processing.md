# Compile sketch
processing-java --sketch=slideshow_controller --export --no-java --platform=linux



# Video library
https://github.com/processing/processing-video/releases

https://github.com/processing/processing-video/releases/download/r3-v2.0-beta1/video-2.0-beta1.zip




# Build video Library
https://github.com/processing/processing-video/issues/71

Go to your sketch folder, then to libraries:
    cd libraries
Make a folder where to store the original video library
    mkdirs ../libraries_off
Move the video library out, so we can clone the video repo
    mv video ../libraries_off
Clone the video library repo
    git clone https://github.com/processing/processing-video.git video
    cd video
Switch to the gst1-java-core branch
    git branch gst1-java-core
You need the Processing source code somewhere, and with the next line you tell the video library the location of the Processing source.
    nano build.properties

Use e.g.:
core.classpath.location=/opt/processing-3.3.7/core/library
compiler.classpath.location=/opt/processing-3.3.7/modes/java


Type this to try build the library
    ant build


Alternative: https://github.com/gohai/processing-glvideo