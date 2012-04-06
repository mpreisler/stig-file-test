#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc/cron.d -type d \( ! -user root \) -printf "GEN003120: %p is %u should be root\n" 2>/dev/null
find /etc/cron.d -type d \( ! -user root \) -printf "GEN003120: %p is %u should be root\n" 2>/dev/null
find /etc/cron.daily -type d \( ! -user root \) -printf "GEN003120: %p is %u should be root\n" 2>/dev/null
find /etc/cron.hourly -type d \( ! -user root \) -printf "GEN003120: %p is %u should be root\n" 2>/dev/null
find /etc/cron.weekly -type d \( ! -user root \) -printf "GEN003120: %p is %u should be root\n" 2>/dev/null
find /var/spool/cron -type d \( ! -user root \) -printf "GEN003120: %p is %u should be root\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
