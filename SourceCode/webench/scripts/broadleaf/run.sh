#!/bin/bash
SERVER_HOST=172.20.209.139
ssh root@$SERVER_HOST "cd /root/webench/scripts/broadleaf;./web_start.sh" 2>&1 &
P1=$!
sleep 5
ssh root@$SERVER_HOST "ps aux | grep yarn | awk '{print \$2}' | xargs kill"
ssh root@$SERVER_HOST "ps aux | grep 'api.jar' | awk '{print \$2}' | xargs kill"
pkill -P $P1
