#!/bin/bash
host1="192.168.226.20"
port1="6380"
host2="192.168.226.20"
port2="6381"
passwd1="admin"
passwd2="admin"
redis-cli -h $host1 -p $port1 -a $passwd1 -n 0 keys "*" 2> /dev/null | while read key
do
redis-cli -h $host1 -p $port1 -a $passwd1 -n 0 --raw dump $key 2> /dev/null | perl -pe 'chomp if eof' | redis-cli -h $host2 -p $port2 -a $passwd2 -n 0 -x restore $key 0 2> /dev/null
echo "migrate key $key"
done
