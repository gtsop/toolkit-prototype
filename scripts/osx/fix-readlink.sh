#!/bin/bash
# http://biercoff.com/readlink-f-unrecognized-option-problem-solution-on-mac/

function greadlink_exists {
 return `which greadlink > /dev/null; echo $?`
}

function readlink_exists {
 return `which readlink > /dev/null; echo $?`
}

function alias_greadlink {
  ln -s /usr/local/bin/greadlink /usr/local/bin/readlink
}

greadlink_exists && readlink_exists || alias_greadlink
