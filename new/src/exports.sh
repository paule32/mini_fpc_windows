#!/bin/sh
set -e
printf 'LIBRARY %s\nEXPORTS\n' "$1"
objdump -p "$1" | awk '/^$/{t=0} {if(t)print$NF} /^\[O/{t=1}'
