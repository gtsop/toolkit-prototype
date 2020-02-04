#!/usr/bin/env bats


setup() {
  TOOLKIT__HOME=$BATS_TMPDIR
  SCRIPTS=$BATS_TMPDIR/scripts
  mkdir $SCRIPTS
  echo "myScriptFunc() { echo 1; }" > $SCRIPTS/my-script.sh
}

@test "loads my-script.sh from scripts/" {

  source ./load-toolkit-script.sh my-script

  myScriptFunc
}

teardown() {
  rm -rf $SCRIPTS
}

