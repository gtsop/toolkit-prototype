#!/usr/bin/env bash

# Environment variables
export TOOLKIT__HOME=`pwd`
export PATH=$PATH:$TOOLKIT__HOME/bin

source load-toolkit-script.sh get-os-name
getOSName TOOLKIT__OS_NAME

export $TOOLKIT__OS_NAME

echo "=========================================="
echo "Make sure you export these in your .bashrc"
echo ""
echo "export TOOLKIT__HOME=`pwd`"
echo "export TOOLKIT__OS_NAME=$TOOLKIT__OS_NAME"
echo ""
echo "PATH=\"\$PATH:\$TOOLKIT__HOME/bin\""
echo ""

# exit

# if [ "$os_name" == "osx" ]
# then
#   source scripts/osx/*.sh
# fi

# if [ "$os_name" == "linux" ]
# then
#   source scripts/linux/*.sh
# fi

# # exit

# # # Make dotfile links
# # ln -sf $TOOLKIT_ROOT_PATH/dotfiles/.bash_profile ~/.bash_profile
# # ln -sf $TOOLKIT_ROOT_PATH/dotfiles/bashrc/.bashrc ~/.bashrc

# # # Install scripts to usr path
# # sudo ln -sf $TOOLKIT_ROOT_PATH/scripts/caps2esc.sh /usr/local/bin/caps2esc
# # sudo ln -sf $TOOLKIT_ROOT_PATH/scripts/greekfont.sh /usr/local/bin/greekfont
# # sudo ln -sf $TOOLKIT_ROOT_PATH/scripts/todo.sh /usr/local/bin/todo

# # # Bootstrap
# # $TOOLKIT_ROOT_PATH/bootstrap/bootstrap.sh
