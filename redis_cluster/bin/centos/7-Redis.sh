#!/bin/bash
LIST=""
for VAR in "$@"
do
 LIST+="${VAR}:7000 "
done
yes 'yes' | ruby redis-trib.rb create --replicas 1 $LIST