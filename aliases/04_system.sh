#!/bin/bash

#   show all mounted devices
alias hdds="df -h | grep /dev/ | sort"

# show mounted devices with uuid-labels
alias hddsi="ls -laF /dev/disk/by-uuid/ && ls -laF /dev/disk/by-label/"


# show my ram in Gb
alias myram="du -hs"

#   show my ip addresses
alias myip="ifconfig -a && iwconfig -a && ip r"

#show my ip
#alias myip2='wget -qO myip http://www.ipchicken.com/; grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" myip;  rm myip'

# information about GUI
#alias mygui=' echo "Windows Manager:"; echo $XDG_CURRENT_DESKTOP;  echo "what option you selected from the lightdm greeter"; echo $GDMSESSION;'


#  show network statistic
#   tcp        0      0 127.0.0.1:5432          0.0.0.0:*               LISTEN      1303/postgres   
alias ns='sudo netstat -ntulp'    


#   packages clear 
alias aptclr="sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean"

alias sai="sudo apt-get install "
alias sas="sudo aptitude search "

#start midmight commander from Super User
alias mcc="sudo mc"
#start vim from sudo user
alias suvi="sudo vim"   

alias agi='sudo apt-get install'

alias hh="history"
alias modx="sudo chmod +x"

