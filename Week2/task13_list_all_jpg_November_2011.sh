#!/bin/bash

# Syncing with remote directory
rsync --archive /cs/home/tkt_cam/public_html/2011/11 ~/Desktop/ShellScripting2020/Week2/2011 --stats

# Listing files, directories and subdirectories
ls -R ~/Desktop/ShellScripting2020/Week2/2011/11 | grep jpg

# I could simply call the previous script like
# task12_list_files_subdirectories_November_2011.sh | grep jpg