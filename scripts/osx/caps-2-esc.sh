#!/usr/bin/env bash
# Resources:
# https://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html
# https://github.com/geerlingguy/mac-dev-playbook/issues/22

function Map {
  echo "${CMD:+${CMD},}{${FROM}: ${1}, ${TO}: ${2}}"
}

function caps2esc {
  # https://github.com/geerlingguy/mac-dev-playbook/issues/22#issuecomment-412284998
  FROM='"HIDKeyboardModifierMappingSrc"'
  TO='"HIDKeyboardModifierMappingDst"'

  # Referencing :
  # https://opensource.apple.com/source/IOHIDFamily/IOHIDFamily-1035.41.2/IOHIDFamily/IOHIDUsageTables.h.auto.html
  SECTION="0x700000064"
  ESCAPE="0x700000029"
  BACKQUOTE="0x700000035"
  CAPS_LOCK="0x700000039"
  L_SHIFT="0x7000000E1"
  R_COMMAND="0x7000000E7"
  L_CONTROL="0x7000000E0"

  CMD=$(Map ${CAPS_LOCK} ${ESCAPE})

  hidutil property --set "{\"UserKeyMapping\":[${CMD}]}"

  #hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'
}

default='skata'
eval "$default=${caps2esc}"

export default
