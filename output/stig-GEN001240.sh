#!/usr/bin/env bash

# Generated from content by Steve Grubb, GPLv2+
#
# original description: system command dirs must be owned by a system group

PATH=/bin:/usr/bin

# start a subshell
output=$(
find /bin -type d \( ! -group root \) -printf "GEN001220: %p is group %g should be root\n" 2>/dev/null
find /sbin -type d \( ! -group root \) -printf "GEN001220: %p is group %g should be root\n" 2>/dev/null
find /usr/bin -type d \( ! -group root \) -printf "GEN001220: %p is group %g should be root\n" 2>/dev/null
find /usr/sbin -type d \( ! -group root \) -printf "GEN001220: %p is group %g should be root\n" 2>/dev/null
find /usr/local/bin -type d \( ! -group root \) -printf "GEN001220: %p is group %g should be root\n" 2>/dev/null
find /usr/local/sbin -type d \( ! -group root \) -printf "GEN001220: %p is group %g should be root\n" 2>/dev/null
find /usr/lib64/qt-3.3/bin -type d \( ! -group root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
find /usr/java/j2re1.4.2_06/bin -type d \( ! -group root \) -printf "GEN001220: %p is user %u should be root\n" 2>/dev/null
)

# we captured output of the subshell, let's interpret it
if [ "$output" == "" ] ; then
    exit $XCCDF_RESULT_PASS
else
    # print the reason why we are failing
    echo "$output"
    exit $XCCDF_RESULT_FAIL
fi

