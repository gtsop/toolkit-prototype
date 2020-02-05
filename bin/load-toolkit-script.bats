#!/usr/bin/env bats

setup() {
  TOOLKIT__HOME=$BATS_TMPDIR
  SCRIPTS=$BATS_TMPDIR/scripts

  mkdir -p $SCRIPTS/a-platform

  echo "aFunction() { echo 1; }; export default=\`eval \$aFunction\`" > $SCRIPTS/a-script.sh
  echo "aPlatformFunction() { echo 1; }" > $SCRIPTS/a-platform/a-script.sh
}

is_function() {
  [ `type -t $1` == "function" ]
}

@test "loads a-script.sh from scripts/" {

  cat $SCRIPTS/a-script.sh
  source ./load-toolkit-script.sh a-script aFunctionLol

  is_function aFunctionLol
}

@test "loads a-platform/a-script.sh from scripts/" {

  TOOLKIT__OS_NAME=a-platform source ./load-toolkit-script.sh a-script aPlatformFunction

  is_function aPlatformFunction
}

@test "throws error if script is not found" {
  run source ./load-toolkit-script.sh script-404

  [ "$status" -eq 1 ]
  [ "$output" = "ERROR: Script not found script-404.sh" ]
}

@test "expands home variable" {

  mkdir -p ~/.toolkit/tmp/scripts
  echo "aFunction() { echo 1; }" > ~/.toolkit/tmp/scripts/a-script.sh

  TOOLKIT__HOME="~/.toolkit/tmp" source ./load-toolkit-script.sh a-script aFunction

  is_function aFunction

  rm -rf ~/.toolkit/tmp
}

teardown() {
  rm -rf $SCRIPTS
}

