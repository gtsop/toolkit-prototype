#!/bin/bash

sudo pacman -S --noconfirm - < $TOOLKIT/bootstrap/packages.txt

# Capslock to Esc
caps2esc --permanent
