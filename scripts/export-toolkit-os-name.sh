#!/bin/bash

source stub.sh/stub.sh

function getOSName {
  # Linux by default
  os_name="linux"


  # Detect OSX
  is_darwin=`uname -a | grep Darwin > /dev/null; echo $?`
  if [ "$is_darwin" == "0" ]
  then
    os_name="osx"
  fi

  echo $os_name

  eval "$1=$os_name"
}


# TOOLKIT__OS_NAME=$os_name
# export TOOLKIT__OS_NAME=$os_name
