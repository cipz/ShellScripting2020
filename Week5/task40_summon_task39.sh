#!/bin/bash

pid_file="task40_summon_task39_pid.txt"

while true
do

    echo "1) Start"
    echo "2) Stop"
    echo "3) Status"
    echo "4) Restart"

    printf "What do you want to do? " 
    read -r choice

    case $choice in 

        1) echo "Starting daemon"
            deamon=nohup $(./task39_dropbox.sh) & echo $! > $pid_file
            echo ""
            ;;
        2) echo "Stopping daemon"
            kill `cat $pid_file`
            break
            echo ""
            ;;
        3) echo "Getting daemon status"
            if pgrep -F $pid_file
            then
                echo "Daemon running"
            else
                echo "Daemon not running"
            fi
            ;;
        4) echo "Restarting daemon"
            kill `cat $pid_file`
            deamon=nohup $(./task39_dropbox.sh) & echo $! > $pid_file
            ;;
        *) echo "Invalid choice. Please try again"
            ;;
    esac

    echo ""

done