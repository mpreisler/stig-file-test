#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: all shell files must be 0755 or less  ???

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc -maxdepth 1 -type f -perm /0022 -name bashrc -printf "GEN001880: %p is %m should be 0755 or less\n" 2>/dev/null
find /etc -maxdepth 1 -type f -perm /0022 -name profile -printf "GEN001880: %p is %m should be 0755 or less\n" 2>/dev/null
find /etc/profile.d/ -type f -perm /0022 -printf "GEN001880: %p is %m should be 0755 or less\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

