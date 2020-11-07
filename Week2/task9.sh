#!/bin/bash

# Counting all files 
ls ~ | tee ls_output
wc -l ls_output

# Counting only folders
ls -d */ | tee ls_output_dirs
wc -l ls_output