#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: smb.conf must be 0644 or less

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc/samba -maxdepth 1 -type f -perm /0133 -name smb.conf -printf "GEN006140: %p is %m should be 0644 or less\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

