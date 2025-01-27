#!/usr/bin/bash

gst-launch-1.0 -v v4l2src device=/dev/video3 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5600 sync=false
gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5601 sync=false
gst-launch-1.0 -v v4l2src device=/dev/video2 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5602 sync=false
