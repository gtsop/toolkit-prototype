#!/bin/bash

modules=(
  excercise/stretch/feet
  excercise/stretch/calves
  excercise 
  nutrition 
)

SCRIPT_PATH=`dirname $(readlink -f "${BASH_SOURCE[0]}")`

for module in ${modules[@]}
do
  source $SCRIPT_PATH/modules/$module.sh
done
