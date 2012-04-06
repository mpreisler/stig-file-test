#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc -maxdepth 1 -type f \( ! -user root \) -name xinetd.conf -printf "GEN003720: %p is user %u should be root\n" 2>/dev/null
find /etc/xinetd.d/ -type f \( ! -user root \) -printf "GEN003720: %p is user %u should be root\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
