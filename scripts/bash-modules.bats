#!/usr/bin/env bats

source ./bash-modules.sh

is_function() {
  [ `type -t $1` == "function" ]
}

setup() {
  touch "a-script.sh"
  echo "aFunction () { echo 1; }" >> a-script.sh
  echo "anotherFunction () { echo 1; }"  >> a-script.sh
}

@test "exposes 'from' function" {

  is_function from
}

@test "'from' expects arguments" {
  run from

  [ "$status" -eq 1 ]
  [ "$output" = "ERROR: no arguments" ]
}

@test "'from' expects a file as the 1st argument" {

  run from not-a-script.sh
  [ "$status" -eq 2 ]
  [ "$output" = "ERROR: expected a file as the first argument" ]
}

@test "'from' expects the 'import' keyword as the 2nd argument" {

  run from a-script.sh
  [ "$status" -eq 3 ]
  [ "$output" = "ERROR: expected to find 'import' keyword after 'a-script.sh'" ]
}

@test "'from' expects the '*' keyword as the 3rd argument" {

  run from a-script.sh import
  [ "$status" -eq 4 ]
  [ "$output" = "ERROR: expected to find '*' keyword after 'import'" ]
}

@test "'from' srouces the given script" {

  from a-script.sh import \*

  is_function aFunction
  is_function anotherFunction
}

teardown() {
  rm "a-script.sh"
}

