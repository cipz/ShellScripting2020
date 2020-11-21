#!/bin/bash

belly_lines=$1

re='^[0-9]+$'
if ! [[ $belly_lines =~ $re ]] 
then
    echo "That's not a number chief"
    exit 1
fi

if [ $belly_lines -gt 1 ]
then
    head -n 8 shortcat.txt
    for i in $(seq 1 $belly_lines)
    do 
        sed "9q;d" shortcat.txt
    done
    tail -n 6 shortcat.txt
else
    echo "Nope"
fi