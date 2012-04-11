#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: cron dirs must be group root

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /etc/cron.d -type d \( ! -group root \) -printf "GEN003140: %p is %g should be root\n" 2>/dev/null
find /etc/cron.d -type d \( ! -group root \) -printf "GEN003140: %p is %g should be root\n" 2>/dev/null
find /etc/cron.daily -type d \( ! -group root \) -printf "GEN003140: %p is %g should be root\n" 2>/dev/null
find /etc/cron.hourly -type d \( ! -group root \) -printf "GEN003140: %p is %g should be root\n" 2>/dev/null
find /etc/cron.weekly -type d \( ! -group root \) -printf "GEN003140: %p is %g should be root\n" 2>/dev/null
find /var/spool/cron -type d \( ! -group root \) -printf "GEN003140: %p is %g should be root\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

