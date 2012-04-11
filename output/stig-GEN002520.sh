#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: all world writable dirs must be owned by system account

PATH=/bin:/usr/bin

# start a subshell
output=$(
find / -path /proc -prune -o -type d \( -perm -0002 -a ! \( -user root -o -user gdm \) \) -printf "GEN002520: world writable %p is user %u should be root\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

