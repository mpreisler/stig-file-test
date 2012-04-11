#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: /root should be 0750 or less

PATH=/bin:/usr/bin

# start a subshell
output=$(
find / -maxdepth 1 -type d -perm /0027 -name root -printf "GEN000920: %p is %m should be 0750 or less\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

