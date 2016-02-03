#!/bin/bash

#DBNAME="analytics"
#TABLES="b_statistic_pageview"
#TABLES="touchtypes stat_users"

#TABLES[2]="touchtypes"
#bar=$(printf ",%s" "${TABLES[@]}")

#echo $bar

#read -r -p "Are you sure? [y/N] " response
function sqldump {

while [[ $# > 1 ]]
do
    key="$1"
#    while [[ $# > 1 ]]
#        do
#    key="$1"

    
case $key in
    -h|--host)
    HOSTNAME="$2"
-    shift # past argument
    ;;
    -u|--user)
    USERNAME="$2"
    shift # past argument
    ;;
    -d|--database)
    DBNAME="$2"
    shift # past argument
    ;;
    -p|--password)
    DBPASSWORD="$2"
    shift # past argument
    ;;
    -c|--compress)
    COMPRESS="$2"
    shift # past argument
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift
done

    

    DEFAULTS_OPTIONS=" --single-transaction --no-autocommit --verbose --compact --opt --quick"
    FNAME=$(date '+%Y-%m-%d_%H-%M-%S');    
    
    
    COMPRESS=" | gzip -9 -c "
    EXT='sql.gz'
    
    echo $DBNAME
    com="mysqldump --user="$USERNAME" --password="$DBPASSWORD" --host="$HOSTNAME" "$DBNAME" "$DEFAULTS_OPTIONS$COMPRESS" > "$DBNAME"_"$FNAME"."$EXT

    echo $com

    unset USERNAME
    unset DBPASSWORD
    unset DBNAME
    unset HOSTNAME
    
}

export -f sqldump

function sqlsource {
    ( 
        echo "SET AUTOCOMMIT=0;"
        echo "SET UNIQUE_CHECKS=0;"
        echo "SET FOREIGN_KEY_CHECKS=0;"
        gunzip < $1
        echo "SET FOREIGN_KEY_CHECKS=1;"
        echo "SET UNIQUE_CHECKS=1;"
        echo "SET AUTOCOMMIT=1;"
        echo "COMMIT;"

    ) | mysql --user=$2 --password=$3 --debug-info $4 --debug-check
}

export -f sqlsource