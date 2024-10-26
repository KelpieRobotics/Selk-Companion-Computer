#! /usr/bin/bash

sudo /home/ubuntu/.local/bin/mavproxy.py --master=/dev/ttyAMA0 --baudrate=115200 --out=udp:0.0.0.0:14550 --aircraft=Sub --cmd="set flushlogs True" --daemon