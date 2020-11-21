#!/bin/bash

dirs=`find lost24/monitor/ -type d -name "2011.11.*"`
files=`find $dirs -type f -name "*temps.txt"`

max_temp_file=""
max_temp=0

for file in $files
do
    temp=`grep "PROCESSOR_ZONE *[0-9][0-9]C" $file -s | cut -b 32-33`
    
    echo "File: $file"
    echo "Temperature: $temp"

    if [ $temp -gt $max_temp ]
    then
        max_temp=$temp
        max_temp_file=$file
    fi

done

echo "Max temp: $max_temp"
echo "Max temp file: $max_temp_file"