#!/usr/bin/env bash

function from {

  if [ -z "$*" ]
  then
    echo "ERROR: no arguments"
    return 1
  fi

  the_file=$1
  if [ ! -f $the_file ]
  then
    echo "ERROR: expecting to find file name after 'from' keyword"
    return 2
  fi

  import_keyword=$2
  if [ "$import_keyword" != "import" ]
  then
     echo "ERROR: expected to find 'import' keyword after 'a-script.sh'"
     return 3
  fi

  star_keyword=$3
  if [ "$star_keyword" != "*" ]
  then

    if [ ! -z "$star_keyword" ]
    then
      source $the_file
    else
      echo "ERROR: expected to find '*' keyword after 'import'"
      return 4
    fi
  fi

  source $the_file
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
