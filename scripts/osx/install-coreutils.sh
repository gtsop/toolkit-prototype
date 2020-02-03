#!/bin/bash

function coreutils_exist {
 return `brew list coreutils > /dev/null; echo $?`
}

function install_coreutils {
  brew install coreutils
}

coreutils_exist || install_coreutils
