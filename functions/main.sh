#!/bin/bash


function vecho {
    if [ $_VERBOSE == "true"  ]; then
        echo ${1}
    fi
}
export -f vecho


# запустить bash скрипт, если такой есть
function runwchk {
#    cat ${1}
    if [ ! -f ${1} ]; then
        echo "not found"
        return
    fi

    local mime=$(file --mime-type -b ${1})
    
    if [ -o checkmime ]; then
        echo "CHECK!"
    fi
    
    if [ ! $mime == "text/x-shellscript" ]; then
        echo ${1}" mime type must be 'text/x-shellscript'."
        return
    fi
    
    echo ${1}
    source ${1}
    
}
export -f runwchk



# запустить все bash скрипты из папки, если такая есть
function rundir {
    if [ -d $1 ]; then
        echo "Run files in directory: $1"

        for i in $( ls $1 ); do
            runwchk ${1}${i}
        done
    else
        echo "Directrory ${1} NOT FOUND"
    fi
}
export -f rundir



# show statistics by top N commands used in terminal
function mylast {
        re='^[0-9]+$'
        if ! [[ $1 =~ $re ]] ; then
           echo "error: $1 not a number!" >&2
           echo "Enter some like that: 'mylast 10'" >&2
        else
           history | awk '{a[$2]++} END {for (i in a) print a[i], i}' | sort -rn | head -n $1
        fi
}
export -f mylast


