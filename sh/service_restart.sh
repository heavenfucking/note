#!/bin/sh

ps -ef | grep "ManqianMCollectScheduleApplication" | awk '{print $2}' | xargs kill -9

ps -ef | grep phantomjs | grep -v grep | cut -c 9-15 | xargs kill -9

echo "ManqianMCollectScheduleApplication and phantomjs has klled "`date  +%Y%m%d%H%M` >> log/kill.log