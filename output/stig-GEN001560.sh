#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: all files in home dirs must be 0750 or less

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /home  -mindepth 2 \( -type d -o -type f \) -perm /0022 -printf "GEN001560: %p is %m should be 0750 or less\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

