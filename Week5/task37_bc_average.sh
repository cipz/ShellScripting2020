#!/bin/bash

sum=0
for i in $@
do
    sum=$(($i + $sum))
done

result=$(echo "scale=2; 1.0 * $sum / $#" | bc -l)

echo "The mean of these " $# " values is " $result