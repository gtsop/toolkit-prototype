#!/bin/bash

# https://brew.sh

function brew_exists {
 return `which brew > /dev/null; echo $?`
}

function install_brew {
  export CI=1

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

brew_exists || install_brew
