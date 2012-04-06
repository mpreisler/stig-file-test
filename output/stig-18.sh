#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc -maxdepth 1 -type f -perm /0137 -name xinetd.conf -printf "GEN003740: %p is %m should be 0640 or less\n" 2>/dev/null
find /etc/xinetd.d/ -type f -perm /0137 -printf "GEN003740: %p is %m should be 0640 or less\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
