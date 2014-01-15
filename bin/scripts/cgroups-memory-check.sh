#!/bin/sh

current_usage=`awk "BEGIN{printf \"%i\", $(oo-cgroup-read memory.usage_in_bytes) / $(oo-cgroup-read memory.limit_in_bytes) * 100}"`

echo "Current gear memory usage is ${current_usage}%"

exit $current_usage
