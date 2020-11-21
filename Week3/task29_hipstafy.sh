#!/bin/bash
  
input_dir="$1"

output_dir=$input_dir/OUTPUT
mkdir -p $output_dir

images=`find $input_dir -type f -name "*.jpg"`

for image in $images
do
    image_name=`basename $image`
    image_prefix=${image_name%.jpg}
    output_file=$output_dir/$image_prefix-hipstah.jpg
    echo "Converting ... $output_file" 
    convert -sepia-tone 60% +polaroid $image $output_file 
done

echo "DONE!"