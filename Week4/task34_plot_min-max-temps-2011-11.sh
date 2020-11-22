#!/bin/bash

dirs=`find lost24/monitor/ -type d -name "2011.11.*"`
dirs=`echo $dirs | tr " " "\n" | sort -u`

output_file="task34_plot_min-max-temps-2011-11.txt"

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
gnuplot task34_plot_min-max-temps-2011-11.p