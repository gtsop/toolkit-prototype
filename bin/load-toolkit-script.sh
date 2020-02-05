#!/usr/bin/env bash

script_paths=(
  $TOOLKIT__HOME/scripts/$TOOLKIT__OS_NAME
  $TOOLKIT__HOME/scripts
)

file_found=false
for path in "${script_paths[@]}"
do
  path="${path//\~/$HOME}"
  if [ -f $path/$1.sh ]
  then
    file_found=true
    source $path/$1.sh
    break
  fi
done

if ! $file_found
then
  echo "ERROR: Script not found $1.sh"
  return 1
fi
