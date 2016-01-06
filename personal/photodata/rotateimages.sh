#!/bin/bash

mkdir images_to_go

for img in *.jpg ; do
    identify=$(identify "$img")
    [[ $identify =~ ([0-9]+)x([0-9]+) ]] || \
        { echo Cannot get size >&2 ; continue ; }
    width=${BASH_REMATCH[1]}
    height=${BASH_REMATCH[2]}


    if [ "$width" -gt "$height" ]; then
        jpegtran -rotate 90 -perfect $img > "images_to_go/"$img
        echo ":copied and rotated"
    else
        cp $img "images_to_go/"$img
        echo ":copied"
    fi
done

