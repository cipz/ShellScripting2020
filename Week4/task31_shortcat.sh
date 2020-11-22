#!/bin/bash

belly_lines=$1
shortcat="task31_shortcat.txt"

re='^[0-9]+$'
if ! [[ $belly_lines =~ $re ]] 
then
    echo "That's not a number chief"
    exit 1
fi

if [ $belly_lines -gt 1 ]
then
    head -n 8 $shortcat
    for i in $(seq 1 $belly_lines)
    do 
        sed "9q;d" $shortcat
    done
    tail -n 6 $shortcat
else
    echo "Nope"
fi