#!/bin/bash

main_loop () {
    trap '' SIGINT  # Ignore SIGINT
    sleep 1  # Small delay to allow process termination

    trap capture_images INT  # Set trap for SIGINT

    ./gstreamer/start_gstreamer.sh

    trap - SIGINT  # Restore default SIGINT handling
    exit
}

capture_images () {
    trap '' SIGINT
    sleep 1

    trap stitch_images INT

    # Delete all images
    rm -rf ./source_images;

    # Clean directories
    rm -rf ./source_images ./tmp
    mkdir ./source_images ./tmp

    # Capture images from one source while others keep running
    gst-launch-1.0 -v v4l2src device=/dev/video3 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5600 sync=false
    gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5601 sync=false
    # gst-launch-1.0 -v v4l2src device=/dev/video2 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5602 sync=false
    gst-launch-1.0 -v v4l2src device=/dev/video2 ! video/x-h264, width=1920,height=1080! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 ! jpegenc ! multifilesink location=./source_images

    wait
    
    stitch_images
}

stitch_images () {
    trap '' SIGINT
    sleep 1

    trap main_loop INT

    python3 stitch.py
    # Run XPANO if defined
    [ -n "$XPANO" ] && $XPANO

    # Execute main loop script
    ./main.sh
    exit
}

main_loop
