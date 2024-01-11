#!/bin/bash

/usr/local/redis/bin/redis-cli --cluster create 192.168.226.20:6061 192.168.226.20:6062 192.168.226.20:6063 192.168.226.20:6064 192.168.226.20:6065 192.168.226.20:6066 --cluster-replicas 1 &
