#!/bin/bash

#show manuals in russian
alias man="man -Lru "
alias man='man -L ru'

alias ls='ls --color -h --group-directories-first -F'
alias lss="ls -lart"
alias lsx="ls -X"


#Permissions

alias own='sudo chown -R ${USER}.${USER}'
alias ownroot='sudo chown -R root.root'
alias ownwww='sudo chown -R www-data.www-data'

alias 755='sudo chmod -R 755'
alias 775='sudo chmod -R 775'
alias 777='sudo chmod -R 777'
alias 644='sudo chmod -R 644'
alias 664='sudo chmod -R 664'

# show list of bash files
alias mybash='for i in $(locate bash | grep home/$USER | grep "\.bash"); do echo $i; done;' 

#display all aliases
alias a="alias"

#edit aliases via vim
alias aa="vim ${USR_CLI}aliases/"

#show aliases with git
alias ag="alias | grep git | sort"

#show aliases with cd
alias acd="alias | grep cd"

#show aliases with ls
alias als="alias | grep 'ls '"
