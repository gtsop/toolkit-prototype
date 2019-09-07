#!/bin/bash

MAP_FILE="$TOOLKIT/scripts/caps2esc.map"

dumpkeys | head -1 > $MAP_FILE
echo "Keycode 58 = Escape" >> $MAP_FILE
sudo loadkeys $MAP_FILE

if [ "$1" == "--permanent" ]
then
	sudo sh -c "echo \"KEYMAP=$MAP_FILE\" > /etc/vconsole.conf"
else
	rm caps2esc.map
fi
