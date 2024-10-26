#! usr/bin/bash 

#install gstreamer
sudo apt install -y libgstreamer1.0-dev \
 libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev \
 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
 gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools \
 gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 \
 gstreamer1.0-qt5 gstreamer1.0-pulseaudio 

#unit file
sudo cp gstreamer.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable gstreamer
sudo systemctl start gstreamer