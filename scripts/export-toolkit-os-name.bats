#!/usr/bin/env bats

source export-toolkit-os-name.sh

@test "getOSName" {

  # Exists
  getOSName;

}
