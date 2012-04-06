#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find / -path /proc -prune -o -type d \( -perm -0002 -a ! -perm -1000 \) -printf "GEN002500: %p is %m should be 1777\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
