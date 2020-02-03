#!/bin/bash

source scripts/export-toolkit-os-name.sh

echo $TOOLKIT__OS_NAME
if [ "$TOOLKIT__OS_NAME" == "osx" ]
then
  echo "here"
  source scripts/osx/install-brew.sh
  source scripts/osx/install-coreutils.sh
  source scripts/osx/fix-readlink.sh
fi

source scripts/export-toolkit-root-path.sh

if [ "$TOOLKIT__OS_NAME" == "linux" ]
then
  # Make dotfile links
  ln -sf $TOOLKIT_ROOT_PATH/dotfiles/.bash_profile ~/.bash_profile
  ln -sf $TOOLKIT_ROOT_PATH/dotfiles/bashrc/.bashrc ~/.bashrc

  # Install scripts to usr path
  sudo ln -sf $TOOLKIT_ROOT_PATH/scripts/caps2esc.sh /usr/local/bin/caps2esc
  sudo ln -sf $TOOLKIT_ROOT_PATH/scripts/greekfont.sh /usr/local/bin/greekfont
  sudo ln -sf $TOOLKIT_ROOT_PATH/scripts/todo.sh /usr/local/bin/todo

  # Bootstrap
  $TOOLKIT_ROOT_PATH/bootstrap/bootstrap.sh
fi

