#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: syslog logs should be 0640 or less

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /var/log -type f -perm /0137 -printf "GEN001260: %p is %m should be 0640 or less\n" 2>/dev/null | egrep -v 'wtmp|lastlog'
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

