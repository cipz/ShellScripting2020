#!/bin/bash

input_dir=$1

max_file=""
max=0

min_file=""
min=99

while read temp
do
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

done < <( find $input_dir -name '*temps.txt' -exec grep 'PROCESSOR' {} \+ | cut -b 75-79 | sed -e "s/C//g" | sed -e "s/\///g" ) 