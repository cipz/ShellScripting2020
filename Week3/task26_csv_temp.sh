#!/bin/bash

./task25_unique_temperatures.sh

echo ""

sed 's/C/C;/' temps.txt > temps.csv

cat temps.csv