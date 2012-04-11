#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: library files must be 0755 or less

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /lib -type f -perm /0022 -printf "GEN001300: %p is %m should be 0755 or less\n" 2>/dev/null
find /lib64 -type f -perm /0022 -printf "GEN001300: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/lib -type f -perm /0022 -printf "GEN001300: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/lib64 -type f -perm /0022 -printf "GEN001300: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/local/lib -type f -perm /0022 -printf "GEN001300: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/local/lib64 -type f -perm /0022 -printf "GEN001300: %p is %m should be 0755 or less\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

