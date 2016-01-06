#!/bin/bash


for img in *.jpg ; do
    echo $img
    
    convert -units PixelsPerInch $img -density 300 "300_"${img}
    convert -sharpen 0x3 \
        -auto-level -auto-gamma \
        "300_"$img "corrected_"$img
    
    rm "300_"${img}
    
done

