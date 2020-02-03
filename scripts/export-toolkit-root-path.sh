#!/bin/bash

source_file=$(readlink -f "${BASH_SOURCE[0]}")
source_file_dir=`dirname $source_file`

export TOOLKIT__ROOT_PATH=$(readlink -f $source_file_dir/../)
