#! /usr/bin/bash

sudo systemctl daemon-reload
sudo systemctl enable mavproxy
sudo systemctl daemon-reload
sudo service mavproxy start
systemctl status mavproxy.service