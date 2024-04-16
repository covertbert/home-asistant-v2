#!/bin/sh

cd /root/config || exit 1

git pull || exit 1

# Run the `ha core check` command
ha core check
core_check_status=$?

if [ $core_check_status -eq 0 ]; then
    # If the command was successful (exit status 0), restart the core
    ha core restart
elif [ $core_check_status -eq 1 ]; then
    # If the command failed (exit status 1), log the error
    exit 1
fi
