#!/bin/sh

# This code was originally created by Marek Mahut <mmahut@redhat.com>
# https://github.com/mmahut/openshift-quota-monitor-cartridge/blob/master/lib/functions

# returns the used space from quota command
function get_used_space() {
  echo $(quota -w|egrep -v '(quotas|Filesystem)'|awk -F ' ' '{ print $2}')
}

# returns the total quota for your gear
function get_quota() {
  echo $(quota -w|egrep -v '(quotas|Filesystem)'|awk -F ' ' '{ print $4}')
}

used_space=$(get_used_space)
quota=$(get_quota)
percentage=$(echo "(${used_space}/${quota})*100" |bc -l|sed 's/^\./0./')

current_usage=${percentage/\.*}

echo "Current gear storage usage is ${current_usage}%"
exit $current_usage
