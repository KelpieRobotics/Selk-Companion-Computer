#!/bin/sh

git clone "https://github.com/krupkat/xpano.git"
cd xpano || exit

# Install required dependencies
sudo apt install -y libgtk-3-dev libopencv-dev libsdl2-dev libspdlog-dev

# Run the build script
./misc/build/build-ubuntu-22.sh

# Set XPANO environment variable
cd xpano/build || exit
export XPANO="$(pwd)/xpano"

# Return to the root directory
cd ../..
