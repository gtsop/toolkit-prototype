#!/bin/bash

sudo cp /etc/netctl/examples/wireless-wpa /etc/netctl/default
sudo netctl enable default

echo "setup-wifi.sh: Please make sure you fill in your ESSID and KEY to /etc/netctl/default"
