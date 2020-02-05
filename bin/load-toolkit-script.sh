#!/usr/bin/env bash

script_paths=(\
  $TOOLKIT__HOME/scripts/$TOOLKIT__OS_NAME/
  $TOOLKIT__HOME/scripts/
)

for path in "${script_paths[@]}"
do
  if [ -f $path/$1.sh ]
  then
    source $path/$1.sh
    break
  fi
done
