#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc/rc* -type f -perm /0022 -printf "GEN001580: %p is %m should be 0755 or less\n" 2>/dev/null
find /etc/init.d -type f -perm /0022 -printf "GEN001580: %p is %m should be 0755 or less\n" 2>/dev/null
# Add checks for upstart and systemd respectively
if [ -d /etc/init ] ; then
find /etc/init -type f -perm /0022 -printf "GEN001580: %p is %m should be 0755 or less\n" 2>/dev/null
elif [ -d /etc/systemd ] ; then
find /etc/systemd -type f -perm /0022 -printf "GEN001580: %p is %m should be 0755 or less\n" 2>/dev/null
fi
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
