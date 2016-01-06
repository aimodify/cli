#!/bin/bash

#export GIT_PROMPT_ONLY_IN_REPO=1
#export GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
#export GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
#export GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme

#source ${USR_CLI}/scripts/bash-git-prompt/gitprompt.sh

#   PROMPT config
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM=git

export GIT_PS1_DESCRIBE_STYLE=contains
export GIT_PS1_SHOWUNTRACKEDFILES=1

PS1='\w$(__git_ps1 " (%s)")\$ '

git config --global core.editor "vim"