#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /boot/grub -maxdepth 1 -type f -perm /0177 -name grub.conf -printf "GEN008720: %p is %m should be 0600 or less\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
