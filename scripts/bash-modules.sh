#!/usr/bin/env bash

function from {

  if [ -z "$*" ]
  then
    echo "ERROR: no arguments"
    return 1
  fi

  from_file=$1

  if [ ! -f $from_file ]
  then
    echo "ERROR: expecting a file as the first argument"
    return 2
  fi


}

function _from {
  source ./$1.sh

  shift;
  shift;

  declared_functions=`typeset -F | awk '{print $NF}' | tr '\n' ' '`;
  to_import_functions="";

  function expect_more_functions {
    return `[ "${1: -1}" == "," ]`
  }


function is_declared {
  return `echo "$declared_functions" | grep -w "$1" > /dev/null && echo $?`;
};

expect_more=true

while (( "$#" ))
do
  requested_func=$1

  if ! $expect_more
  then
    echo "ERROR: Didn't expect function name. Missing a comma?"
    return 1
  fi

  expect_more=false
  if expect_more_functions $requested_func
  then
    expect_more=true
    requested_func="${requested_func::-1}"
  fi

  requested_alias=''
  if [ "$2" == "as" ]
  then
    requested_alias=$3

    if expect_more_functions $requested_alias
    then
      echo "yes, expecting more"
      echo $3
      expect_more=true
      requested_alias="${3::-1}"
    fi

  fi

  if is_declared $requested_func
  then
    echo "importing $requested_func"
    if [ "$requested_alias" != "" ]
    then
      eval "$requested_alias() { $requested_func; }"
      echo "$requested_alias() { $requested_func; }"
      shift;
      shift;
    fi
  else
    echo "ERROR: Undeclared function '$requested_func'"
    return 1
  fi
  shift
done

if $expect_more
then
  echo "ERROR: Expected more function definitions"
  return 1
fi
#if [ "$4" == "as" ]
#then
#eval "$5() { $3; }"
#fi
}
