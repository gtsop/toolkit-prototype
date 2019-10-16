#!/bin/bash

TODO_FILE=~/.todo

if [ ! -f $TODO_FILE ]
then
  touch $TODO_FILE
fi

if [ "$1" == "edit" ]
then
  vim $TODO_FILE
else
  cat $TODO_FILE
fi
