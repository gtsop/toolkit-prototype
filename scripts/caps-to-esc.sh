#!/bin/bash

dumpkeys | head -1 > caps2esc.map
echo "Keycode 58 = Escape" >> caps2esc.map
sudo loadkeys caps2esc.map
rm caps2esc.map
