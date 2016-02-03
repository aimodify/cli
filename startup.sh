#!/bin/bash
# Parameters, paths, USER-Params

USR_STARTUP_LOGS=true
_VERBOSE=true


USR_CLI="/usr/local/cli/"
USR_PROJECTS="/var/www/"
USR_LOGS="/var/logs/"
USR_IDE="/usr/local/apps/netbeans-8.1/bin/"
USR_BACKUP_FOLDER='/media/backup/'

source ${USR_CLI}"functions/00_main.sh"

rundir ${USR_CLI}"completions/"
rundir ${USR_CLI}"functions/"
rundir ${USR_CLI}"autoload/"
rundir ${USR_CLI}"aliases/"

export HISTIGNORE="ls:history:cd:sudo"
export PATH=$PATH:/home/ai/.composer/vendor/bin
#export PATH=${PATH}:~/Downloads/android-sdk-linux/platform-tools

export MYSQL_PS1="\u@\h [\d]>"