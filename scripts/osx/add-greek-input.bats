#!/usr/bin/env bats

source ../../lib/stub.sh/stub.sh
source ./add-greek-input.sh

@test "it uses the defaults utility to add greek input" {

  stub_and_echo defaults "test"

  addGreekInput

  stub_called_with defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add "<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>-18944</integer><key>KeyboardLayout Name</key><string>Greek</string></dict>"

  restore defaults
}
