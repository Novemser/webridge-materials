#!/bin/bash
SERVER_HOST=172.20.209.139
SERVER_APP=broadleaf

ssh root@$SERVER_HOST "ps aux | grep 'api.jar' | awk '{print \$2}' | xargs kill"
sleep 5
ssh root@$SERVER_HOST "ps aux | grep 'api.jar' | awk '{print \$2}' | xargs kill -9"
ssh root@$SERVER_HOST "ps aux | grep 'yarn' | awk '{print \$2}' | xargs kill -9"

ssh root@$SERVER_HOST "cd /root/webench/scripts/$SERVER_APP;./web_start.sh & disown" 2>&1 &
P1=$!
sleep 6
echo 'wait 30s for web server to start'
sleep 30
pkill -P $P1
