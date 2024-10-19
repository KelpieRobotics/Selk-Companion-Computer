#! /usr/bin/bash

sudo apt install -y python3-dev python3-opencv python3-wxgtk4.0 python3-pip python3-matplotlib python3-lxml python3-pygame
pip3 install PyYAML mavproxy --user
echo 'export PATH="/home/ubuntu/.local/bin"' >> ~/.bashrc

# copy service to correct directory
sudo cp mavproxy.service /etc/systemd/system/