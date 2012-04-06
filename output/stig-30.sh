#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc -maxdepth 1 -type f -perm /0177 -name crontab -printf "GEN003080: %p is %m should be 0600 or less\n" 2>/dev/null
find /etc/cron.d -type f -perm /0077 -printf "GEN003080: %p is %m should be 0700 or less\n" 2>/dev/null
find /etc/cron.d -type f -perm /0077 -printf "GEN003080: %p is %m should be 0700 or less\n" 2>/dev/null
find /etc/cron.daily -type f -perm /0077 -printf "GEN003080: %p is %m should be 0700 or less\n" 2>/dev/null
find /etc/cron.hourly -type f -perm /0077 -printf "GEN003080: %p is %m should be 0700 or less\n" 2>/dev/null
find /etc/cron.weekly -type f -perm /0077 -printf "GEN003080: %p is %m should be 0700 or less\n" 2>/dev/null
find /var/spool/cron/ -type f -perm /0077 -printf "GEN003080: %p is %m should be 0700 or less\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
