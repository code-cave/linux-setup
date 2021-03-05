#!/usr/bin/env bash

# This is my awesome .bash_profile!

###################### Sources ######################

[ -s ${HOME}/.bashrc ] && . ${HOME}/.bashrc
[ -s ${HOME}/.bash/sources.sh ] && . ${HOME}/.bash/sources.sh

################### Command Prompt ##################

PS1a="\[\033[00m\]\n\u@\h \[\033[32m\]\w\[\033[33m\]"
# Custom Tie Fighter prompt
PS1b="\n\[\033[34m\](\[\033[37m\]⤎\[\033[34m\]❂\[\033[37m\]–\[\033[34m\]) \[\033[00m\]"
#PS1b="\n\[\033[34m\]\$ \[\033[00m\]"
git_branch=$([ -n "$(declare -f parse_git_branch)" ] && echo "\$(parse_git_branch)")
PS1="${PS1a}${git_branch}${PS1b}"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

