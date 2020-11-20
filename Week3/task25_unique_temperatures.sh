#!/bin/bash

record_date="2011.12.25"
workdir="/home/cip/Desktop/UNI/ShellScripting2020/Week3/lost24/monitor/$record_date"

rm -f temps.txt
rm -f temps_tmp.txt

for dir in `find $workdir -type d`
do
    # ls $dir/hp-temps.txt
    grep "PROCESSOR_ZONE *[0-9][0-9]C" $dir/hp-temps.txt -s | cut -b 32-34 >> temps_tmp.txt
done

sort temps_tmp.txt | uniq > temps.txt

rm temps_tmp.txt

cat temps.txt