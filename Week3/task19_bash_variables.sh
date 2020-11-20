#!/bin/bash

myvar="can you see me?"

echo "Variable in shell 1: $myvar"
echo "Shell 1 PID: $$"

echo ""

bash -c 'echo "Variable in shell 2: $myvar" ; echo "Shell 2 PID: $$"'