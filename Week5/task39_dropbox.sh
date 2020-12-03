#!/bin/bash

while read line
do
    ./task39_dropbox_hipstafy.sh "$line"
done < <( inotifywait -qm --format "%f" --event create dropbox/. )