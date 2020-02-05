#!/usr/bin/env bats

source ../stub.sh/stub.sh
source caps-2-esc.sh

@test "uses hidutil to map caps lock to esc" {

  stub_and_echo hidutil "test"

  echo $default
  echo "=="

  stub_called_with hidutil property --set "{\"UserKeyMapping\":[{\"HIDKeyboardModifierMappingSrc\": 0x700000039, \"HIDKeyboardModifierMappingDst\": 0x700000029}]}"

  restore hidutil
}
