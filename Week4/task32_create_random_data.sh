#!/bin/bash

output_file="task32_create_random_data.txt"

rm -f $output_file

for i in $(seq 1 $1)
do 
    # echo $(( $RANDOM % 10 )) $(( $RANDOM % 10 )) >> $output_file
    echo $RANDOM $RANDOM >> $output_file
done

cat $output_file

# Plotting the data
gnuplot task32_create_random_data.p 