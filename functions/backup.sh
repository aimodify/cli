#!/bin/bash

function tarfolders {

    if [ -z "$1" ]
    then
        ddir="/tmp"
    else
        ddir=$1
    fi

    cd "$ddir"
    mkdir __archives -p
    x="__archives"
    for i in `ls -d */|sed s%/%%g`; do
        if [ "$i" != "__archives" ] 
        then
        d="__archive";
        echo "archiving $i to: $i.tar.gz" 
        tar czf $x/$i.tar.gz $i/;
        echo "OK";
        fi
    done
}
export -f tarfolders




function backupfolder {

    echo ${BPROOT}$1

    if [ ! -d ${BPROOT}$1 ]
    then
        echo "create dir: "${BPROOT}$1
        mkdir -p ${BPROOT}$1
    fi

    if [ -d $1 ] && [ -d ${BPROOT}$1 ]; then
        echo $(du -sh $1)
        echo "backup folder: "$1
        cp -vR $1 ${BPROOT}$1
    fi
}
export -f backupfolder