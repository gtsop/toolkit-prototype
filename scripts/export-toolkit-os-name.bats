#!/usr/bin/env bats

source export-toolkit-os-name.sh

@test "getOSName" {

  # Returns "linux"
  os_name=$(getOSName)
  [ "$os_name" == "linux" ]

  # Returns "osx"
  # os_name=$(getOSName)
  # [ "$os_name" == "osx" ]
}
