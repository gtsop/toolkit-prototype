#!/bin/bash
#
# https://www.gnu.org/software/bash/manual/bash.html#index-PS1
# https://www.gnu.org/software/bash/manual/bash.html#Controlling-the-Prompt
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
#

export PS1="\e[1;30m\u\e[m\e[35m@\e[m\e[1;30m\h\e[m \e[36m\W\e[m \e[35m$\e[m "
