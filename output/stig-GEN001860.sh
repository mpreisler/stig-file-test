#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: all shell files in /etc must be owned by root

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc -maxdepth 1 -type f \( ! -user root \) -name bashrc -printf "GEN001860: %p is user % should be root\n" 2>/dev/null
find /etc -maxdepth 1 -type f \( ! -user root \) -name profile -printf "GEN001860: %p is user %u should be root\n" 2>/dev/null
find /etc/profile.d/ -type f \( ! -user root \) -printf "GEN001860: %p is user %u should be root\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

