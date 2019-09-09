#!/bin/bash

SCRIPT_PATH=`dirname $(readlink -f "${BASH_SOURCE[0]}")`

source $SCRIPT_PATH/aliases/git.sh
source $SCRIPT_PATH/aliases/links.sh
source $SCRIPT_PATH/aliases/ls.sh
source $SCRIPT_PATH/aliases/ping.sh
source $SCRIPT_PATH/aliases/tree.sh

source $SCRIPT_PATH/behaviours/bash-completion.sh
source $SCRIPT_PATH/behaviours/bash-prompt.sh
source $SCRIPT_PATH/behaviours/editor.sh
source $SCRIPT_PATH/behaviours/history-control.sh

