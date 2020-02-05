#!/usr/bin/env bats


setup() {
  TOOLKIT__HOME=$BATS_TMPDIR
  SCRIPTS=$BATS_TMPDIR/scripts

  mkdir $SCRIPTS
  mkdir $SCRIPTS/a-platform

  echo "aFunction() { echo 1; }" > $SCRIPTS/a-script.sh
  echo "aPlatformFunction() { echo 1; }" > $SCRIPTS/a-platform/a-script.sh
}

is_function() {
  [ `type -t $1` == "function" ]
}

@test "loads a-script.sh from scripts/" {

  source ./load-toolkit-script.sh a-script

  is_function aFunction
}

@test "loads a-platform/a-script.sh from scripts/" {

  TOOLKIT__OS_NAME=a-platform source ./load-toolkit-script.sh a-script

  ! is_function aFunction

  is_function aPlatformFunction
}

teardown() {
  rm -rf $SCRIPTS
}

