#!/bin/bash

SCRIPT_PATH=`dirname $(readlink -f "${BASH_SOURCE[0]}")`

for script in $SCRIPT_PATH/{aliases,behaviours}/*
do
  source $script
done

