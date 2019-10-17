#!/bin/bash

# Linux by default
os_name="linux"

# Detect OSX
is_darwin=`uname -a | grep Darwin > /dev/null; echo $?`
if [ "$is_darwin" == "0" ]
then
  os_name="osx"
fi

export TOOLKIT__OS_NAME=os_name
