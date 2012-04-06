#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc/sysconfig/network-scripts -type f -perm /0022 -printf "GEN001180: %p is %m should be 0755 or less\n" 2>/dev/null
find /etc/sysconfig/networking -type f -perm /0022 -printf "GEN001180: %p is %m should be 0755 or less\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
