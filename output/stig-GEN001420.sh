#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: shadow must be 0400 or less

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc -maxdepth 1 -type f -perm /0377 -name shadow -printf "GEN001420: %p is %m should be 0400 or less\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

