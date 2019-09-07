#!/bin/bash

SCRIPT_PATH=`dirname $(readlink -f "${BASH_SOURCE[0]}")`
export TOOLKIT=$SCRIPT_PATH

# Make dotfile links
ln -sf $TOOLKIT/dotfiles/.bash_profile ~/.bash_profile
ln -sf $TOOLKIT/dotfiles/bashrc/.bashrc ~/.bashrc

# Install scripts to usr path
sudo ln -sf $TOOLKIT/scripts/caps2esc.sh /usr/local/bin/caps2esc
sudo ln -sf $TOOLKIT/scripts/todo.sh /usr/local/bin/todo

# Bootstrap
$TOOLKIT/bootstrap/bootstrap.sh

