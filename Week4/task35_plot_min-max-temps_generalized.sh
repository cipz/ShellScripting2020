#!/bin/bash

input_dir=$1

# Example input lost24/monitor/2011.10
dirs=`find ./ -type d -maxdepth 3 -wholename "*$input_dir*" 2>/dev/null`
dirs=`echo $dirs | tr " " "\n" | sort -u`

output_file="task35_plot_min-max-temps_generalized.txt"

rm -f $output_file

for day in $dirs
do

    max_temp_file=""
    max_temp=0

    min_temp_file=""
    min_temp=99

    for temp_file in `find $day -type f -name "*temps.txt"`
    do
        temp=`grep "PROCESSOR_ZONE *[0-9][0-9]C" $temp_file -s | cut -b 32-33`
        # echo $temp_file $temp
        if [ $temp -gt $max_temp ]
        then
            max_temp=$temp
            max_temp_file=$temp_file
        fi
        if [ $temp -lt $min_temp ]
        then
            min_temp=$temp
            min_temp_file=$temp_file
        fi
    done
    
    day=${day##*/}
    day=${day: -2}
    
    echo MAX TEMP $day : $max_temp \($max_temp_file\)
    echo MIN TEMP $day : $min_temp \($min_temp_file\)
    echo $day $max_temp $min_temp >> $output_file
    echo

done

# cat $output_file
gnuplot task35_plot_min-max-temps_generalized.p