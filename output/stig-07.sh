#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /bin -type f -perm /0022 -printf "GEN001200: %p is %m should be 0755 or less\n" 2>/dev/null
find /sbin -type f -perm /0022 -printf "GEN001200: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/bin -type f -perm /0022 -printf "GEN001200: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/sbin -type f -perm /0022 -printf "GEN001200: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/local/bin -type f -perm /0022 -printf "GEN001200: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/local/sbin -type f -perm /0022 -printf "GEN001200: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/lib64/qt-3.3/bin -type f -perm /0022 -printf "GEN001200: %p is %m should be 0755 or less\n" 2>/dev/null
find /usr/java/j2re1.4.2_06/bin -type f -perm /0022 -printf "GEN001200: %p is %m should be 0755 or less\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
