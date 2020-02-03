#!/usr/bin/env bats

source stub.sh/stub.sh
source export-toolkit-os-name.sh

@test "getOSName works for linux" {
  stub_and_echo uname "Linux"

  getOSName result

  [ "$result" == "linux" ]
}

@test "getOSName works for osx" {
  stub_and_echo uname "Darwin"

  getOSName result

  [ "$result" == "osx" ]
}

teardown() {
  restore uname
}
