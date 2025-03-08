main_loop () {
    trap SIGINT
    sleep 1 # Small time to actually to kill the process
    # Just Spam CTRL-C 

    trap "captutre_images" INT
    
    SCRIPT_DIR=$(dirname "$0")
    GSTREAMER_SCRIPT="$SCRIPT_DIR/../gstreamer/start_gstreamer.sh"

    # Run the gstreamer script
    "$GSTREAMER_SCRIPT"

    trap SIGINT 

    exit
}

captutre_images () {
    trap SIGINT
    sleep 1 # Small time to actually to kill the process

    trap "stitch_images" INT

    # # Delete all images
    rm -rf ./source_images;

    # # Create folders
    mkdir ./source_images;

    # Delete all images
    rm -rf ./tmp;

    # Create folders
    mkdir ./tmp;

    # sleep 5;

    # Capture images from one source while others keep running
    gst-launch-1.0 -v v4l2src device=/dev/video3 ! video/x-h264, width=1920,height=1080 ! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5600 sync=false &
    gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-h264, width=1920,height=1080 ! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5601 sync=false &
    # gst-launch-1.0 -v v4l2src device=/dev/video2 ! video/x-h264, width=1920,height=1080 ! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5602 sync=false &
    gst-launch-1.0 -v v4l2src device=/dev/video2 ! video/x-h264, width=1920,height=1080 ! h264parse ! queue ! rtph264pay config-interval=10 pt=96 ! udpsink host=192.168.137.255 port=5602 sync=false ! jpegenc ! multifilesink location=./source_images &

    wait  # Wait for all background processes to finish
    stitch_images
}

stitch_images() {
    trap SIGINT
    sleep 1 # Small time to actually to kill the process
    trap "main_loop" INT;
    python3 ./stitch.py;
    # python3 ; # main.py should create a subproccess that listens to node and saves to specific folder & also stitches images
    trap SIGINT;
    $XPANO;
    ./main.bash;
    exit
}

main_loop
