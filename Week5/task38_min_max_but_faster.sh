#!/bin/bash

dir=$1

max_file=""
max=0

min_file=""
min=99

while read file
do
    temp=`grep "PROCESSOR_ZONE *[0-9]\+C" $file | cut -b 32-33`
    temp=`echo $temp | sed -e "s/C//g"`

    if [ $temp -gt $max ]
    then
        max=$temp
        max_file=$file
        echo "NEW MAX: $max_file $max"
    fi
    if [ $temp -lt $min ]
    then
        min=$temp
        min_file=$file
        echo "NEW MIN: $min_file $min"
    fi

done < <( for file in `find $dir -type f -name "*hp-temps.txt"` ; do echo $file ; done )