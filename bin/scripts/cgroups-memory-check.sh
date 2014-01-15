#!/bin/sh

exit `awk "BEGIN{printf \"%i\", $(oo-cgroup-read memory.usage_in_bytes) / $(oo-cgroup-read memory.limit_in_bytes) * 100}"`
