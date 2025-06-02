#!/usr/bin/bash

mavproxy.py --daemon \
    --master=/dev/ttyS6 \
    --baudrate=115200 \
    --out=udpbcast:192.168.137.255:14450 \
    --aircraft=Sub \
    --cmd="set flushlogs True"
