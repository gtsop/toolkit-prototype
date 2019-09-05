#!/bin/bash

if [ "$1" == "edit" ]
then
  vim ~/.todo
else
  cat ~/.todo
fi
