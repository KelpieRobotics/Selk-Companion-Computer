#!/usr/bin/bash

# Cam 1
gst-launch-1.0 -v v4l2src platform-xhci-hcd.0-usbv2-0:0:1:1.0-video-index2 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5600 sync=false

# Cam 2
gst-launch-1.0 -v v4l2src platform-xhci-hcd.0-usbv2-0:2:1.0-video-index2 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5601 sync=false

# Cam 3
gst-launch-1.0 -v v4l2src platform-xhci-hcd.1-usbv2-0:2:1.0-video-index2 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5602 sync=false


# USB PORTS as they are plugged in

#   USB0         USB2
# top left       top right
# Pixhawk        Cam 1

#   USB1         USB3
# bottom left     bottom right
#  Cam 2          Cam 3