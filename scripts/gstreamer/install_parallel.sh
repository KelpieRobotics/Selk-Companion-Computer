#!/usr/bin/bash

sudo apt install parallel

#unit file
sudo cp parallel.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable parallel
sudo systemctl start parallel