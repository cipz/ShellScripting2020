#!/bin/bash

# Syncing with remote directory
# echo `rsync --archive /cs/home/tkt_cam/public_html/$(date +%Y/%m) ~/Desktop/ShellScripting2020/Week2/$(date +%Y) --stats`
rsync --archive /cs/home/tkt_cam/public_html/2016/11 ~/Desktop/ShellScripting2020/Week2/2016/11 --stats

# Listing image files
# find ~/Desktop/ShellScripting2020/Week2/$(date +%Y/%m) -name '*.jpg' -type f | wc -l
find ~/Desktop/ShellScripting2020/Week2/2016/11 -name '*.jpg' -type f | wc -l
