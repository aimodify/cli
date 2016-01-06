#!/bin/bash

#  apache2 commands
alias aps='sudo service apache2 start'
alias apst='sudo service apache2 stop'
alias apre='sudo service apache2 restart'
alias apmods='apache2ctl -M | grep "_" | sort'

# change directrory  and show apache2 log files (newer first)
alias aplogs='cd /var/log/apache2/ && ls -r'

# nginx aliases
alias ngs="sudo service nginx start"
alias ngre="sudo service nginx restart"
alias ngst="sudo service nginx stop"
# change directrory  and show nginx log files (newer first)
alias nglogs="cd /var/logs/nginx/ && ls -r"
alias ngcfg="sudo service nginx configtest"

#Vagrant
alias vgs="vagrant global-status"
alias vl="vagrant list-commands"