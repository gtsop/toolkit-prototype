#
# behaviours/bash_completion.sh
#

# Command reference:
# https://github.com/scop/bash-completion

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion
