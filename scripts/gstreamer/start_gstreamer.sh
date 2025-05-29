#!/usr/bin/bash

parallel --line-buffer << END
gst-launch-1.0 -v \
    v4l2src device=/dev/v4l/by-id/usb-Sonix_Technology_Co.__Ltd._exploreHD_USB_Camera_DWE-0001-video-index2 ! \
    video/x-h264, width=1920,height=1080 ! \
    h264parse ! \
    queue ! \
    rtph264pay config-interval=10 pt=96 ! \
    udpsink host=192.168.137.255 port=5600 sync=false

gst-launch-1.0 -v \
    v4l2src device=/dev/v4l/by-id/usb-Sonix_Technology_Co.__Ltd._exploreHD_USB_Camera_DWE-0002-video-index2 ! \
    video/x-h264, width=1920,height=1080 ! \
    h264parse ! \
    queue ! \
    rtph264pay config-interval=10 pt=96 ! \
    udpsink host=192.168.137.255 port=5601 sync=false

gst-launch-1.0 -v \
    v4l2src device=/dev/v4l/by-id/usb-Sonix_Technology_Co.__Ltd._exploreHD_USB_Camera_DWE-0003-video-index2 ! \
    video/x-h264, width=1920,height=1080 ! \
    h264parse ! \
    queue ! \
    rtph264pay config-interval=10 pt=96 ! \
    udpsink host=192.168.137.255 port=5602 sync=false
END
