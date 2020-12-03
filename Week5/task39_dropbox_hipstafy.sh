#!/bin/bash

input_dir="dropbox"
input_file="$1"

output_dir="$input_dir/hipstafied"
mkdir -p $output_dir

image_name=`basename $input_dir/$input_file`
image_prefix=${image_name%.jpg}
output_file=$output_dir/$image_prefix-hipstah.jpg
echo "Converting ... $output_file" 
convert -sepia-tone 60% +polaroid $input_dir/$input_file $output_file 