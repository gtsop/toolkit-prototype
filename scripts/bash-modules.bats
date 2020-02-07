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

@test "'from' expects 1st argument to be a file" {

  run from not-a-script.sh
  [ "$status" -eq 2 ]
  [ "$output" = "ERROR: expecting to find file name after 'from' keyword" ]
}

@test "'from' expects 2nd argument to be the 'import' keyword" {

  run from a-script.sh
  [ "$status" -eq 3 ]
  [ "$output" = "ERROR: expected to find 'import' keyword after 'a-script.sh'" ]
}

@test "'from' expects 3rd argument to be the '*' keyword" {

  run from a-script.sh import
  [ "$status" -eq 4 ]
  [ "$output" = "ERROR: expected to find '*' keyword after 'import'" ]
}

@test "'from' sources the script" {

  from a-script.sh import \*

  is_function aFunction
  is_function anotherFunction
}

@test "'from' sources given function from script" {

  from a-script.sh import aFunction

  is_function aFunction
}

@test "'from' does not import the rest of the defined functions" {

  from a-script.sh import aFunction

  !is_function anotherFunction
}

teardown() {
  rm "a-script.sh"
}

