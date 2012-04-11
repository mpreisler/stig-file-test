#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: skeleton /etc/skel/* files must be 0644 or less

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc/skel -type f -perm /0133 -printf "GEN001800: %p is %m should be 0644 or less\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

