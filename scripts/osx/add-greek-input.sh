#!/usr/bin/env bash

function addGreekInput {

  KIND="Keyboard Layout"
  LAYOUT_ID="-18944"
  LAYOUT_NAME="Greek"

  defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add "<dict><key>InputSourceKind</key><string>$KIND</string><key>KeyboardLayout ID</key><integer>$LAYOUT_ID</integer><key>KeyboardLayout Name</key><string>$LAYOUT_NAME</string></dict>"
}
