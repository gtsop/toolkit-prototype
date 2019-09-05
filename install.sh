#!/bin/bash
#
# install.sh
#

# Install packages
sudo pacman -S --noconfirm - < packages.txt

# Make dotfile links
ln -sf $(pwd)/dotfiles/bashrc/.bashrc ~/.bashrc

# Install scripts to usr path
sudo ln -sf $(pwd)/scripts/caps-to-esc.sh /usr/local/bin/caps2esc
sudo ln -sf $(pwd)/scripts/todo.sh /usr/local/bin/todo
