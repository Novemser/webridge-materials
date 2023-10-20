#!/bin/bash
SERVER_HOST=172.20.209.139
SERVER_APP=myblog

ssh root@$SERVER_HOST "ps aux | grep 'my-blog' | awk '{print \$2}' | xargs kill"
sleep 5
ssh root@$SERVER_HOST "ps aux | grep 'my-blog' | awk '{print \$2}' | xargs kill -9"

ssh root@$SERVER_HOST "cd /root/webench/scripts/$SERVER_APP;./web_start_using_normal.sh & disown" 2>&1 &
P1=$!
sleep 20
echo 'wait 10s for web server to start'
sleep 10
# pkill -P $P1