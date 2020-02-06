#!/usr/bin/env bats

source ./bash-modules.sh

is_function() {
  [ `type -t $1` == "function" ]
}

@test "exposes 'from' function" {
  is_function from
}

@test "'from' throws errors if there no arguments" {
  run from

  [ "$status" -eq 1 ]
  [ "$output" = "ERROR: no arguments" ]
}

@test "'from' expects an existing file as the first argument" {
  touch "a-script.sh"

  run from not-a-script.sh
  [ "$status" -eq 2 ]
  [ "$output" = "ERROR: expecting a file as the first argument" ]

  run from a-script.sh
  [ "$status" -eq 0 ]

  rm "a-script.sh"
}
