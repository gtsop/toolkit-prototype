#!/usr/bin/env bash

# https://superuser.com/questions/1338719/set-change-input-source-shortcut-from-terminal
function inputSourceChangeAltShift {
  defaults write "com.apple.symbolichotkeys" "AppleSymbolicHotKeys" -dict-add 36 "{ enabled = 1; value = { parameters = (524288, 131072); type = 'standard'; }; }"
}
