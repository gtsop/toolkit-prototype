#!/usr/bin/env bats

source ../../lib/stub.sh/stub.sh
source ./input-source-change-alt-shift.sh

@test "uses defaults utility to set input source change shortcut" {

  stub_and_echo defaults "test"

  inputSourceChangeAltShift

  stub_called_with defaults write "com.apple.symbolichotkeys" "AppleSymbolicHotKeys" -dict-add 36 "{ enabled = 1; value = { parameters = (524288, 131072); type = 'standard'; }; }"

  restore defaults
}
