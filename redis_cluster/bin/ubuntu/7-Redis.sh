#!/bin/bash
cd /usr/share/doc/redis-tools/examples
LIST=""
for VAR in "$@"
do
 LIST+="${VAR}:7000 "
done
yes 'yes' | ruby redis-trib.rb create --replicas 1 $LIST