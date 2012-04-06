#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
PATH=/bin:/usr/bin

# start a subshell
output=$(
find /bin -type d \( ! -user root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
find /sbin -type d \( ! -user root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
find /usr/bin -type d \( ! -user root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
find /usr/sbin -type d \( ! -user root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
find /usr/local/bin -type d \( ! -user root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
find /usr/local/sbin -type d \( ! -user root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
find /usr/lib64/qt-3.3/bin -type d \( ! -user root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
find /usr/java/j2re1.4.2_06/bin -type d \( ! -user root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
)

if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi
