#!/bin/bash
# Parameters, paths, USER-Params


USR_STARTUP_LOGS=true
_VERBOSE=true


USR_CLI="/usr/local/cli/"
USR_PROJECTS="/var/www/"
USR_LOGS="/var/logs/"
USR_IDE="/usr/local/apps/netbeans-8.1/bin/"
USR_BACKUP_FOLDER='/media/backup/'

source ${USR_CLI}"functions/main.sh"
source ${USR_CLI}"completions/git-completion.bash"
source ${USR_CLI}"completions/npm-completion.bash"

rundir ${USR_CLI}"autoload/"
rundir ${USR_CLI}"aliases/"

export HISTIGNORE="ls:history:cd:sudo"
#export PATH=${PATH}:~/Downloads/android-sdk-linux/tools
#export PATH=${PATH}:~/Downloads/android-sdk-linux/platform-tools
