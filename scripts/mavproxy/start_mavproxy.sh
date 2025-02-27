#!/usr/bin/bash

mavproxy.py usb-ArduPilot_Pixhawk4-bdshot_290042000251333035363236-if02 --baudrate=115200 --out=udp:0.0.0.0:14550 --aircraft=Sub --cmd="set flushlogs True" --daemon

# POSSIBLE OTHER PATH (UNSURE)
# usb-ArduPilot_Pixhawk4-bdshot_290042000251333035363236-if00

# USB PORTS as they are plugged in

#   USB0         USB2
# top left       top right
# Pixhawk        Cam 1

#   USB1         USB3
# bottom left     bottom right
#  Cam 2          Cam 3