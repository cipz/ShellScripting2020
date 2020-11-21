#!/bin/bash

./task25_unique_temperatures.sh

echo ""

sed 's/ +/ /g; s/\s+/,/g; s/\//,/g' temps.txt > temps.csv

cat temps.csv