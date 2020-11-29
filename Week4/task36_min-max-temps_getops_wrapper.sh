#!/bin/bash

if [ "$#" -lt 1 ]
then
    echo ""
    echo "You have passed no argumets. Try again, but follow the rules!"
    echo ""
    ./task36_min-max-temps_getops_wrapper.sh -h
    exit 1
fi

c=false
w=false
ascii=false

while getopts ":cwbah" option
do

    case $option in

        ## COLDEST TEMPERATURES ##
        c) c=true
            continue
            ;;

        ## WARMEST TEMPERATURES ##
        w) w=true   
            continue        
            ;;

        ## BOTH TEMPERATURES ##
        b) c=true
            w=true
            continue
            ;;

        ## ASCII output ##
        a) ascii=true
            continue
            ;;
        
        ## HELP ##
        h)  echo ""
            echo "-- HELP --"
            echo "-c: coldest teperatures"
            echo "-w: warmest teperatures "
            echo "-b: both of the above"
            echo "-a: ASII output"
            echo "-h: help (this menu, exits the program even if there are other arguments present)"
            echo ""
            echo "After these arguments pass the date of the folder you want to search for"
            echo ""
            exit 0
            ;;
        
        ## ANYTHING ELSE ## 
        *) ./task36_min-max-temps_getops_wrapper.sh -h
            exit 1
            ;;
    esac
done

if [ "$c" == false ] && [ "$w" == false ]
then
    ./task36_min-max-temps_getops_wrapper.sh -h
    exit 1
fi

input_dir=$2

# Example input lost24/monitor/2011.10
dirs=`find ./ -type d -maxdepth 3 -wholename "*$input_dir*" 2>/dev/null`
dirs=`echo $dirs | tr " " "\n" | sort -u`

output_file="task36_min-max-temps_getops_wrapper.txt"

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

        # If the user wants the warmest temperatures then we calculate them
        if [ "$w" == true ]
        then
            if [ $temp -gt $max_temp ]
            then
                max_temp=$temp
                max_temp_file=$temp_file
            fi
        fi

        # If the user wants the coldest temperatures then we calculate them
        if [ "$c" == true ]
        then
            if [ $temp -lt $min_temp ]
            then
                min_temp=$temp
                min_temp_file=$temp_file
            fi
        fi
    done
    
    day=${day##*/}
    day=${day: -2}
    
    echo -n $day " " >> $output_file

    if [ "$w" == true ] ; then echo MAX TEMP $day : $max_temp \($max_temp_file\) ; echo -n $max_temp " " >> $output_file ; fi
    if [ "$c" == true ] ; then echo MIN TEMP $day : $min_temp \($min_temp_file\) ; echo -n $min_temp " " >> $output_file ; fi

    echo " " >> $output_file

    echo ""

done

gnuplot_output_file=${input_dir: -7}
gnuplot_output_file=`echo "$gnuplot_output_file" | sed "s/\./_/g"`

# cat $output_file
gnuplot -e "max='$w'" \
        -e "min='$c'" \
        -e "ascii='$ascii'" \
        -e "output_file='$gnuplot_output_file'" \
        task36_min-max-temps_getops_wrapper.p
