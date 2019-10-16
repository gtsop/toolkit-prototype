#!/bin/bash

setfont gr737a-9x16

if [ "$1" == "--permanent" ]
then
  sudo sh -c "echo \"FONT=gr737a-9x16\" >> /etc/vconsole.conf"
fi
