#!/usr/bin/bash

sudo apt install -y python3-dev python3-opencv python3-wxgtk4.0 python3-pip python3-matplotlib python3-lxml python3-pygame
pip3 install PyYAML mavproxy --user
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc # TODO: Don't append if it already exists

# copy service to correct directory
sudo cp mavproxy.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable mavproxy
sudo systemctl start mavproxy
